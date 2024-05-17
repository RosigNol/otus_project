package main

import (
	"strconv"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"github.com/gofiber/fiber/v2/middleware/idempotency"
)

func StartServer(port int, orderController *orderController) error {
	app := fiber.New()
	app.Use(cors.New())

	app.Use(idempotency.New(idempotency.Config{
		Lifetime: time.Hour * 24,

		KeyHeader: "X-Idempotency-Key",
	}))

	app.Use(Recover)
	app.Get("/health", orderController.HealthCheck)

	app.Post("/create", orderController.Create)

	return app.Listen(":" + strconv.Itoa(port))
}
