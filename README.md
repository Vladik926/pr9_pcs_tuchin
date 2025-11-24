Программирование корпоротивных систем
 Отчет оп пр №9 
Тучин Владислав ЭФБО-06-23

Скриншот Dashboard: Database - Notes:
<img width="785" height="731" alt="database" src="https://github.com/user-attachments/assets/f9f3a4cd-2fbc-47ee-9891-0045110aae10" />

Policies и RLS:
<img width="1860" height="1016" alt="policies" src="https://github.com/user-attachments/assets/59d8d536-02d9-458d-8d47-f0afc103b55d" />

Скриншот экрана входа и экрана с пустым списком:
<img width="585" height="731" alt="вход" src="https://github.com/user-attachments/assets/2b270628-a6dc-457b-9726-f44b94825fd1" />
<img width="585" height="731" alt="пустые заметки" src="https://github.com/user-attachments/assets/e175ae7b-9463-436c-9101-99785274213e" />
<img width="1877" height="351" alt="после входа" src="https://github.com/user-attachments/assets/9852908a-e34c-4dab-b473-aff97393eba5" />

Скриншот после редактироавния и удаления:
<img width="365" height="840" alt="заметки создание" src="https://github.com/user-attachments/assets/ceb0ca41-f475-4d61-b719-d90ebcdfe035" />
<img width="1891" height="278" alt="они же в бд" src="https://github.com/user-attachments/assets/950536e6-e2fe-4a11-b7a3-692dc56ae4ff" />
<img width="1883" height="246" alt="после обновления" src="https://github.com/user-attachments/assets/6764f52a-3e4e-488b-accc-89d1f8239630" />
<img width="518" height="1153" alt="после обновления заметки" src="https://github.com/user-attachments/assets/ce5ce3bb-6436-47b5-abe7-9c401bce7677" />

## Шаги подключения Supabase

1. **Создание проекта**
   - Зарегистрировал проект на платформе supabase.com
   - Получил уникальные идентификаторы доступа из раздела настроек API:
     Project URL - https://iwqcyarssagcdxefxkqe.supabase.co                                                                    
     anon public - eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml3cWN5YXJzc2FnY2R4ZWZ4a3FlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM5NzUwNzUsImV4cCI6MjA3OTU1MTA3NX0.RZi_zcC2XFMtkB6q6RkaLUoCX41eF6QqtuT69CgO3xE

2. **Настройка базы данных**
   - Создал таблицу `notes` со следующей структурой полей:
     - `id` - уникальный идентификатор
     - `user_id` - идентификатор владельца записи
     - `title`, `content` - текстовая информация заметки
     - `created_at`, `updated_at` - временные метки создания и обновления

3. **Настройка безопасности**
   - Активировал механизм RLS (Row Level Security) для защиты на уровне строк
   - Настроил политики доступа:
     - Чтение только собственных записей
     - Создание записей от своего имени
     - Редактирование и удаление исключительно своих заметок

4. **Интеграция с Flutter**
   - Добавил зависимость в pubspec.yaml: `supabase_flutter: ^2.0.0`
   - Выполнил инициализацию в main.dart:
   `

## Рекомендации для production-релиза

**1. Контроль доступа**
- Текущая ситуация: доступ открыт для всех пользователей
- Рекомендация: ограничить функционал только аутентифицированными пользователями

**2. Валидация входных данных**
- Текущая ситуация: принимается произвольный текст без ограничений
- Рекомендация: внедрить проверку длины содержимого и фильтрацию потенциально опасного кода

**3. Защита конфиденциальной информации**
- Текущая ситуация: ключи доступа хранятся в исходном коде
- Рекомендация: использовать защищенные переменные окружения для хранения чувствительных данных
