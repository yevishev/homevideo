package app

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func Start() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.JSON(http.StatusBadGateway, []string{
			"foo",
			"bar",
			"fyz",
		})
	})

	e.Logger.Fatal(e.Start(":8003"))
}
