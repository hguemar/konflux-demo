package main

import (
	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
)

func main() {
	// Initialize logger
	log := logrus.New()
	log.Info("Starting Hello World application...")

	// Create Gin router
	r := gin.Default()

	// Define route
	r.GET("/", func(c *gin.Context) {
		log.Info("Received request for /")
		c.JSON(200, gin.H{
			"message": "Hello, World!",
			"status":  "success",
		})
	})

	r.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status": "healthy",
		})
	})

	// Start server
	log.Info("Server starting on :8080")
	r.Run(":8080")
}
