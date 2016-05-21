<h2>Построение модели программы по ее документации.</h2>

<h5>Документация</h5>

<h6>Введение</h6>
<ul>
  <li>Документация создана с помощью RubyDoc.</li>
  <li>Формат документации (in): HTML.</li>
  <li>Формат моделей библиотек (out): XML.</li>
  <li>Анализируем: Ruby</li>
</ul>

<h6>Ограничение на анализируемые бибилотеки</h6>
<ul>
  <li>– Каждый файл содержит только один класс</li>
  <li>– Класс полностью определяется в файле (нет partial классов)</li>
  <li>– Класс содержит только методы и поля</li>
  <li>– Нет наследования, виртуальных, абстрактных методов</li>
  <li>– Нет интерфейсов</li>
  <li>– Переменные в методы передаются только по значению (не по ссылке)</li>
  <li>– Нет значений по умолчанию для параметров метода</li>
  <li>– Нет обобщённых классов/методов</li>
  <li>– Все файлы с кодом в папке проекта используются</li>
  <li>– Весь код - синтаксически валидный</li>
</ul>

<h6>Пример того, что получится (в XML):</h6>
Model:
    Namespace (includes N):
    Class (includes N, is T):
    Function (includes N, AM, S, T)
    Property (includes N, AM, S, T)
    Function (includes AM, S, T)
    Property (includes AM, S, T)

Detailed:
  Namespace
  File Location (/src/file.cs)
  	Logical Location (System.Collections.Immutable)
  Function:
  Argument Type
  Argument Name

Description:
  Name (aka N)
  Access Modifiers (aka AM): [Private/Protected/Public/etc]
  Scope (aka S) [Instance]
  Type (aka T) [Object]















