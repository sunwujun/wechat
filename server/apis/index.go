package apis

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/go-playground/locales/zh"
	ut "github.com/go-playground/universal-translator"
	"github.com/go-playground/validator/v10"
	zht "github.com/go-playground/validator/v10/translations/zh"
	"reflect"
	"strings"
	"wechat/pkg/e"
)

var (
	Trans    ut.Translator
	Validate *validator.Validate
)

func init() {
	zh := zh.New()
	uni := ut.New(zh, zh)
	Trans, _ = uni.GetTranslator("zh")

	Validate = validator.New()
	Validate.RegisterTagNameFunc(func(field reflect.StructField) string {
		label := field.Tag.Get("comment")
		if label == "" {
			return field.Name
		}
		return label
	})
	zht.RegisterDefaultTranslations(Validate, Trans)
}

func BindStruct(ctx *gin.Context, s interface{}) {
	if err := ctx.BindJSON(s); err != nil {
		ctx.AbortWithStatusJSON(400, gin.H{
			"code": e.ERROR,
			"msg":  err.Error(),
		})
	}

	if err := Validate.Struct(s); err != nil {
		fmt.Println(Translate(err))
		ctx.AbortWithStatusJSON(400, gin.H{
			"code": e.ERROR,
			"msg":  Translate(err),
		})
	}
}

func Translate(err error) string {
	errs := err.(validator.ValidationErrors)
	var errList []string
	for _, e := range errs {
		errList = append(errList, e.Translate(Trans))
	}
	return strings.Join(errList, "; ")
}
