workspace "Интернет магазин (учебный проект отус)" "Архитектура решения интернет магазина" {

    model {

# Пользователи
        operator = person "Пользователь" "Использует интернет магазин для покупки товаров"

# Системы

        !include lib/store.dsl
        !include lib/storeandroid.dsl
        !include lib/storeios.dsl
        !include lib/storehuawei.dsl
        !include lib/storeweb.dsl

## Взаимодействия систем

        operator -> storeandroid "Взаимодействует с приложением" "Физически"
        operator -> storeios "Взаимодействует с приложением" "Физически"
        operator -> storehuawei "Взаимодействует с приложением" "Физически"
        operator -> storeweb "Взаимодействует с приложением" "Физически"
        storeandroid -> store "Запросы взаимодействия" "REST"
        storeios -> store "Запросы взаимодействия" "REST"
        storehuawei -> store "Запросы взаимодействия" "REST"

## Конец взаимодействия систем

# Взаимодействие контейнеров

        storeandroid -> store_user "Запрос сведений пользователя для отображения" "REST"
        storeios -> store_user "Запрос сведений пользователя для отображения" "REST"
        storehuawei -> store_user "Запрос сведений пользователя для отображения" "REST"
        storeweb -> store_user "Запрос сведений пользователя для отображения" "REST"

        storeandroid -> store_auth "Запрос авторизации пользователя" "REST"
        storeios -> store_auth "Запрос авторизации пользователя" "REST"
        storehuawei -> store_auth "Запрос авторизации пользователя" "REST"
        storeweb -> store_auth "Запрос авторизации пользователя" "REST"

        storeandroid -> store_order "1. Запрос формирования заказа" "REST"
        storeios -> store_order "1. Запрос формирования заказа" "REST"
        storehuawei -> store_order "1. Запрос формирования заказа" "REST"
        storeweb -> store_order "1. Запрос формирования заказа" "REST"

        storeandroid -> store_billing "Запрос баланса лицевого счета" "REST"
        storeios -> store_billing "Запрос баланса лицевого счета" "REST"
        storehuawei -> store_billing "Запрос баланса лицевого счета" "REST"
        storeweb -> store_billing "Запрос баланса лицевого счета" "REST"

        1c = store_order -> store_billing "1.1. Запрос на оплату (списывание денег со счета)" "REST"
        2c = store_order -> store_rabbit "1.2. Запрос на формирование оповещения (о списывание денег со счета)" "MQ"
        3c = store_rabbit -> store_notification "1.3. Запрос на выдачу сформированого оповещения (о списывание денег со счета)" "MQ"

        store_user -> store_db "Сохраняет информацию о пользователе" "SQL"
        store_order -> store_db "Сохраняет информацию о заказе" "SQL"
        store_billing -> store_db "Сохраняет информацию о счете" "SQL"
        store_auth -> store_db "Запрашивает информацию для авторизации" "SQL"
        store_notification -> store_db "Сохраняет информацию об оповещениях" "SQL"

# Конец взаимодействия контейнеров

# Взаимодействия компонентов

# Конец взаимодействия компонентов

    }
    views {

        systemlandscape "s01-SystemLandscape" "Системный ландшафт" {
            title "[Store-01] Схема системного контекста работы Store"
            include *
        }

        container store "s02-Containers" "Диаграмма контейнеров" {
            title "[Store-02] Схема контейнеров Store"
            include *
        }

        styles {

            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }

            element db {
                shape cylinder
                #background #08427b
                #color #ffffff
            }

            element rabbit {
                shape pipe
                #background #08427b
                #color #ffffff
            }

            element app {
                shape MobileDevicePortrait
                #background #08427b
                #color #ffffff
            }

            element Москва {
                background #CC2222
                color #ffffff
            }

            element "Web Browser" {
                shape WebBrowser
            }

        }

    }

}
