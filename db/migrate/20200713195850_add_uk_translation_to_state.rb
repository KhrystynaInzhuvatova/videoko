class AddUkTranslationToState <  SpreeExtension::Migration[4.2]
  def change
    Spree::State.find(3299).update!(locale: "uk",name: "Вінницька")
    Spree::State.find(3300).update!(locale: "uk",name: "Волинська")
    Spree::State.find(3301).update!(locale: "uk",name: "Луганська")
    Spree::State.find(3302).update!(locale: "uk",name: "Дніпропетровська")
    Spree::State.find(3303).update!(locale: "uk",name: "Донецька")
    Spree::State.find(3304).update!(locale: "uk",name: "Житомирська")
    Spree::State.find(3305).update!(locale: "uk",name: "Закарпатська")
    Spree::State.find(3306).update!(locale: "uk",name: "Запорізька")
    Spree::State.find(3307).update!(locale: "uk",name: "Івано-Франківська")
    Spree::State.find(3308).update!(locale: "uk",name: "м.Київ")
    Spree::State.find(3309).update!(locale: "uk",name: "Київська")
    Spree::State.find(3310).update!(locale: "uk",name: "Кіровоградська")
    Spree::State.find(3311).update!(locale: "uk",name: "м.Севастополь")
    Spree::State.find(3312).update!(locale: "uk",name: "Автономна Республіка Крим")
    Spree::State.find(3313).update!(locale: "uk",name: "Львівська")
    Spree::State.find(3314).update!(locale: "uk",name: "Миколаївська")
    Spree::State.find(3315).update!(locale: "uk",name: "Одеська")
    Spree::State.find(3316).update!(locale: "uk",name: "Полтавська")
    Spree::State.find(3317).update!(locale: "uk",name: "Рівненська")
    Spree::State.find(3318).update!(locale: "uk",name: "Сумська")
    Spree::State.find(3319).update!(locale: "uk",name: "Тернопільська")
    Spree::State.find(3320).update!(locale: "uk",name: "Харківська")
    Spree::State.find(3321).update!(locale: "uk",name: "Херсонська")
    Spree::State.find(3322).update!(locale: "uk",name: "Хмельницька")
    Spree::State.find(3323).update!(locale: "uk",name: "Черкаська")
    Spree::State.find(3324).update!(locale: "uk",name: "Чернігівська")
    Spree::State.find(3325).update!(locale: "uk",name: "Чернівецька")
  end
end
