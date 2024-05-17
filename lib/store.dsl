store = softwareSystem "Store" "Обеспечивает выполнение бизнес функций приложения интернет магазина (Golang, Fiber fm)" Москва {
	store_order = container "1.1 Order service" "Обеспечивает работу базовых функций сервиса заказов" "Golang, Fiber fm"
	store_billing = container "1.2 Billing service" "Обеспечивает работу базовых функций сервиса оплат" "Golang, Fiber fm"
	store_notification = container "1.3 Notification service" "Обеспечивает работу базовых функций сервиса оповещений (E-mail)" "Golang, Fiber fm"
	store_auth = container "1.4 Auth service" "Обеспечивает работу базовых функций сервиса авторизации" "Golang, Fiber fm"
	store_user = container "1.5 User service" "Обеспечивает работу базовых функций сервиса пользователей" "Golang, Fiber fm"

	store_db = container "1.6 Общее хранилище" "Хранит бизнес данные приложения (пользователей, заказы, факты оплат, лицевой счет и т.д.)" "PostgreSQL" db
	store_rabbit = container "1.7 Брокер сообщений" "Управление потоками информации между сервисами" "RabbitMQ" rabbit

}
