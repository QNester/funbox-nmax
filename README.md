# Funbox - Nmax

## Зависимости

* Ruby 2.4.1 и bundler

## Установка

Выполнить следующие команды в терминале:
```
git clone git@github.com:QNester/funbox-nmax.git
cd funbox-nmax
gem build nmax.gemspec
gem install nmax-0.1.0.gem
bundle install
```

## Выполнение
Чтобы выполнить скрипт надо выполнить команду:
```
cat <YOUR_TXT_FILE> | ./nmax <N>
```
Где `N` - число необходимых чисел в выводе. 
Если вы не укажите это число, то оно поставится по умолчанию на `1000`

## Тесты
Для запуска тестов гема необходимо запустить:
```
bundle exec rspec
ruby test_script.rb
``` 

## Дополнительно
Для решения задания был создан топик на SO: 

https://stackoverflow.com/questions/46749170/parse-large-stdin-ruby
