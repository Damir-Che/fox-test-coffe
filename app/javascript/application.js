// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery3
//= require popper
//= require bootstrap-sprockets


let tg = window.Telegram.WebApp;

console.log(tg)

tg.MainButton.text = "Order"; //изменяем текст кнопки
// tg.MainButton.setText("Changed Text1"); //изменяем текст кнопки иначе
tg.MainButton.textColor = "#ffffff"; //изменяем цвет текста кнопки
tg.MainButton.color = "#F55353"; //изменяем цвет бэкграунда кнопки
// tg.MainButton.setParams({"color": "#143F6B"});
