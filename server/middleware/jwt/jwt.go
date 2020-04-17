package jwt

import (
	"errors"
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"net/http"
	"time"
	"wechat/pkg/e"
	"wechat/pkg/logger"
)

func JWTAuth() gin.HandlerFunc {
	return func(c *gin.Context) {
		token := c.Request.Header.Get("token")
		if token == "" {
			c.JSON(http.StatusOK, gin.H{
				"code": e.ERROR_AUTH_CHECK_TOKEN_FAIL,
				"msg":  e.GetMsg(e.ERROR_AUTH_CHECK_TOKEN_FAIL),
			})
			c.Abort()
			return
		}

		j := NewJWT()
		claims, err := j.ParseToken(token)
		if err != nil {
			if err == TokenExpired {
				if token, err = j.RefreshToken(token); err == nil {
					c.JSON(http.StatusOK, gin.H{
						"code":  e.ERROR_AUTH_CHECK_TOKEN_TIMEOUT,
						"msg":   e.GetMsg(e.ERROR_AUTH_CHECK_TOKEN_TIMEOUT),
						"token": token,
					})
				}
				c.Abort()
				return
			}
			logger.Error(e.GetMsg(e.ERROR_AUTH), logger.WithError(err))
			c.JSON(http.StatusOK, gin.H{
				"code": e.ERROR_AUTH,
				"msg":  e.GetMsg(e.ERROR_AUTH),
			})
			c.Abort()
			return
		}
		c.Set("claims", claims)
	}
}

type JWT struct {
	SigningKey []byte
}

var (
	TokenExpired     = errors.New("Token is expired")
	TokenNotValidYet = errors.New("Token not active yet")
	TokenMalformed   = errors.New("That's not even a token")
	TokenInvalid     = errors.New("Couldn't handle this token:")
	SignKey          = "WeChatDemo"
)

type CustomClaims struct {
	ID   int    `json:"userId"`
	Name string `json:"name"`
	Uid  string `json:"phone"`
	jwt.StandardClaims
}

func NewJWT() *JWT {
	return &JWT{[]byte(GetSignKey())}
}

func GetSignKey() string {
	return SignKey
}

func SetSignKeyt(key string) string {
	SignKey = key
	return SignKey
}

func (j *JWT) CreateToken(claims CustomClaims) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString(j.SigningKey)
}

func (j *JWT) ParseToken(tokenString string) (*CustomClaims, error) {
	token, err := jwt.ParseWithClaims(tokenString, &CustomClaims{}, func(token *jwt.Token) (i interface{}, err error) {
		return j.SigningKey, nil
	})

	if err != nil {
		if ve, ok := err.(*jwt.ValidationError); ok {
			if ve.Errors&jwt.ValidationErrorMalformed != 0 {
				return nil, TokenMalformed
			} else if ve.Errors&jwt.ValidationErrorExpired != 0 {
				return nil, TokenExpired
			} else if ve.Errors&jwt.ValidationErrorNotValidYet != 0 {
				return nil, TokenNotValidYet
			} else {
				return nil, TokenInvalid
			}
		}
	}

	if claims, ok := token.Claims.(*CustomClaims); ok && token.Valid {
		return claims, nil
	}

	return nil, TokenInvalid
}

func (j *JWT) RefreshToken(tokenString string) (string, error) {
	jwt.TimeFunc = func() time.Time {
		return time.Unix(0, 0)
	}
	token, err := jwt.ParseWithClaims(tokenString, &CustomClaims{}, func(token *jwt.Token) (i interface{}, err error) {
		return j.SigningKey, nil
	})

	if err != nil {
		logger.Error(e.GetMsg(e.ERROR_AUTH), logger.WithError(err))
		return "", err
	}

	if claims, ok := token.Claims.(*CustomClaims); ok && token.Valid {
		jwt.TimeFunc = time.Now
		claims.StandardClaims.ExpiresAt = time.Now().Add(1 * time.Hour).Unix()
		return j.CreateToken(*claims)
	}
	return "", TokenInvalid
}
