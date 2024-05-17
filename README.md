Проектная работа по микросервисной архитектуре
Тема: Архитектура как код

Сборка С4 dsl: 
1. Запусть runme.bat в папке c4

Инструкция по деплою приложения: 
1. Создание ns:
   ```bash
   kubectl apply -f k8s/namespaces.yaml
   ```
3. Установка RabbitMQ:
   ```bash
   helm install -f k8s/rabbit.yaml my-rabbit bitnami/rabbitmq -n rabbit
   ```
4. Запуск сервисов:
   ```bash
   kubectl apply -f k8s/config.yaml -f k8s/postgres.yaml -n postgres
   kubectl apply -f k8s/config.yaml -f k8s/auth-app.yaml -n auth
   kubectl apply -f k8s/config.yaml -f k8s/user-app.yaml -n user
   kubectl apply -f k8s/config.yaml -f k8s/billing-app.yaml -n billing
   kubectl apply -f k8s/config.yaml -f k8s/order-app.yaml -n order
   kubectl apply -f k8s/config.yaml -f k8s/notification-app.yaml -n notification
   ```
5. Nginx:
   ```bash
   kubectl apply -f k8s/nginx-routes.yaml
   ```

Дополнительный материал: 
1. Результаты тестов: test_result.png, сами тесты: OTUS. Stream processing.postman_collection.json
2. Свимлайны и схемы архитектуры С4: в папке diagrams
3. Видео презентация: https://disk.yandex.ru/i/eljfd9BT_a1t3Q
