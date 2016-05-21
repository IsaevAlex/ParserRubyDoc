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
<ul>Model:
  <li>Namespace (includes N):</li>
  <li>Class (includes N, is T):</li>
  <li>Function (includes N, AM, S, T)</li>
  <li> Property (includes N, AM, S, T)</li>
  <li>Function (includes AM, S, T)</li>
  <li>Property (includes AM, S, T)</li>
</ul>

<ul>Detailed:
  <li>Namespace</li>
  <li>File Location (/src/file.cs)</li>
  <li>Logical Location (System.Collections.Immutable)</li>
  <li>Function:</li>
  <li>Argument Type</li>
  <li>  Argument Name</li>
</ul>

<ul>Description:
  <li>Name (aka N)</li>
  <li>Access Modifiers (aka AM): [Private/Protected/Public/etc]</li>
  <li>Scope (aka S) [Instance]</li>
  <li>Type (aka T) [Object]</li>
</ul>
    
    
    
   
    
    


  
  
  
  
  



  
  
  
  















