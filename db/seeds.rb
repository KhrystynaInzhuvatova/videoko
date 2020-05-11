"=============================================================================================================================="
"=============================================================================================================================="
vyluchi_paneli_vyrobnuk = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id,
    name: 'Тип підключення',
    presentation: 'Тип підключення',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id,
    name: 'К-сть абонентів',
    presentation: 'К-сть абонентів',
    position: 4
  }
]
vyluchi_paneli_vyrobnuk.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

vyl_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id)
vyl_pr = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id)
vyl_pid = Spree::OptionType.find_by!(name: 'Тип підключення', taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id)
vyl_ab = Spree::OptionType.find_by!(name: 'К-сть абонентів', taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id)

manufacturer_vyl = { dahua: "Dahua", hikvision: "Hikvision", qualvision: "Qualvision", slinex: "Slinex", arny: "Arny", kocom: "Kocom"}

pr_vyl = {
  v_p: "Виклична панель",
  vid_dz: "Відеодзвінок",
  dz: "Дзвінок"
}
pid_vyl = {
  an: "Аналоговий",
  mez: "Мережевий",
  dr: "2х дротовий"
}
ab_vyl ={
  one: "1",
  two: "2",
  four: "4",
  bag: "багатоквартирні"
}
manufacturer_vyl.each_with_index do |manufacturer, index|
  vyl_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

pr_vyl.each_with_index do |manufacturer, index|
  vyl_pr.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

pid_vyl.each_with_index do |manufacturer, index|
  vyl_pid.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

ab_vyl.each_with_index do |manufacturer, index|
  vyl_ab.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 7"
"=============================================================================================================================="
"=============================================================================================================================="
monitory = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Монітори").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Монітори").id,
    name: 'Тип підключення',
    presentation: 'Тип підключення',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Монітори").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 3
  }
]
monitory.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

mor_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Монітори").id)
mon_pid = Spree::OptionType.find_by!(name: 'Тип підключення', taxon_id: Spree::Taxon.find_by(name: "Монітори").id)
mon_pr = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Монітори").id)

manufacturer_mon = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  qualvision: "Qualvision",
  slinex: "Slinex",
  arny: "Arny",
  kocom: "Kocom"}

pid_mon = {
  an: "Аналоговий",
  mez: "Мережевий",
  dr: "2х дротовий"
}
typ_mon ={
  mon: "Монітор",
  mas: "Майстер станція",
}
manufacturer_mon.each_with_index do |manufacturer, index|
  mor_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

pid_mon.each_with_index do |manufacturer, index|
  mon_pid.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

typ_mon.each_with_index do |manufacturer, index|
  mon_pr.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 8"
"=============================================================================================================================="
"=============================================================================================================================="
pereg_vyrobnuk = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Переговорні пристрої").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  }

]
pereg_vyrobnuk.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

per_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Переговорні пристрої").id)

manufacturer_per = { dahua: "Dahua", hikvision: "Hikvision", qualvision: "Qualvision", slinex: "Slinex", arny: "Arny", kocom: "Kocom"}


manufacturer_per.each_with_index do |manufacturer, index|
  per_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 9"
"=============================================================================================================================="
"=============================================================================================================================="
tp = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Аксесуари").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Аксесуари").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  }

]
tp.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

ax_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Аксесуари").id)
ax_pid = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Аксесуари").id)


manufacturer_tp = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  qualvision: "Qualvision",
  slinex: "Slinex",
  arny: "Arny",
  kocom: "Kocom"}

tp_p = {
  mod_poz: "Модуль розширення",
  pass: "Passive POE комутатор",
  con: "Конвертер",
  ram: "Рамки для врізного монтажу",
  ram_mon: "Рамки для накладного монтажу",
  cronsh: "Кронштейн",
  sug: "Розподілювач сигналу"
}

manufacturer_tp.each_with_index do |manufacturer, index|
  ax_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_p.each_with_index do |manufacturer, index|
  ax_pid.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 10"
"=============================================================================================================================="
"=============================================================================================================================="
cont = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Контролери").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Контролери").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Контролери").id,
    name: 'К-сть зчитувачів',
    presentation: 'К-сть зчитувачів',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Контролери").id,
    name: 'Інтерфейс зчитувачів',
    presentation: 'Інтерфейс зчитувачів',
    position: 4
  }

]
cont.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

con_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Контролери").id)
con_pr = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Контролери").id)
con_zch = Spree::OptionType.find_by!(name: 'К-сть зчитувачів', taxon_id: Spree::Taxon.find_by(name: "Контролери").id)
con_int = Spree::OptionType.find_by!(name: 'Інтерфейс зчитувачів', taxon_id: Spree::Taxon.find_by(name: "Контролери").id)


manufacturer_con = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  zkteco: "ZKTeco",
  fortnet: "Fortnet",
  prox: "U-Prox",
  orbita: "Orbita",
  satel: "Satel",
  seven: "Seven"
}

tp_con = {
  stn: "Стандартний",
  avt: "Автономний",
  lift: "Для ліфта"
}
kl_con = {
  a: "1",
  b: "2",
  c: "4",
  d: "8",
  i: "16"
}
int_con = {
  rs: "RS485",
  wi: "Wiegand",
  sh: "Шина"
}

manufacturer_con.each_with_index do |manufacturer, index|
  con_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_con.each_with_index do |manufacturer, index|
  con_pr.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end


kl_con.each_with_index do |manufacturer, index|
  con_zch.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

int_con.each_with_index do |manufacturer, index|
  con_int.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 11"
"=============================================================================================================================="
"=============================================================================================================================="
zch = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id,
    name: 'Тип карт',
    presentation: 'Тип карт',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id,
    name: 'Інтерфейс зчитувачів',
    presentation: 'Інтерфейс зчитувачів',
    position: 3
  }

]
zch.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

zch_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id)
zch_tp = Spree::OptionType.find_by!(name: 'Тип карт', taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id)
zch_in = Spree::OptionType.find_by!(name: 'Інтерфейс зчитувачів', taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id)


manufacturer_zch = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  zkteco: "ZKTeco",
  fortnet: "Fortnet",
  prox: "U-Prox",
  orbita: "Orbita",
  satel: "Satel",
  seven: "Seven"
}

zch_typ = {
  em: "EM Marine",
  mir: "Mifare",
  bl: "Bluetooth"
}
zch_int = {
  rs4: "RS485",
  w: "Wiegand",
  shyn: "Шина"
}

manufacturer_zch.each_with_index do |manufacturer, index|
  zch_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

zch_typ.each_with_index do |manufacturer, index|
  zch_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

zch_int.each_with_index do |manufacturer, index|
  zch_in.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 12"
"=============================================================================================================================="
"=============================================================================================================================="
tern = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Термінали").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Термінали").id,
    name: 'Тип підключення',
    presentation: 'Тип підключення',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Термінали").id,
    name: 'Інтерфейс зчитувачів',
    presentation: 'Інтерфейс зчитувачів',
    position: 3
  }

]
tern.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

ter_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Термінали").id)
ter_tp = Spree::OptionType.find_by!(name: 'Тип підключення', taxon_id: Spree::Taxon.find_by(name: "Термінали").id)
ter_zch = Spree::OptionType.find_by!(name: 'Інтерфейс зчитувачів', taxon_id: Spree::Taxon.find_by(name: "Термінали").id)

manufacturer_ter = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  zkteco: "ZKTeco",
  fortnet: "Fortnet",
  prox: "U-Prox",
  orbita: "Orbita",
  satel: "Satel",
  seven: "Seven"
}

mer_typ = {
  mer: "Мережевий",
  avt: "Автономний"
}

tern_z = {
  rs: "RS485",
  wi: "Wiegand",
  sh: "Шина",
  nm: "Нема"
}

manufacturer_ter.each_with_index do |manufacturer, index|
  ter_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

mer_typ.each_with_index do |manufacturer, index|
  ter_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tern_z.each_with_index do |manufacturer, index|
  ter_zch.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 13"
"=============================================================================================================================="
"=============================================================================================================================="
zam = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Замки").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Замки").id,
    name: 'Тип замка',
    presentation: 'Тип замка',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Замки").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 3
  }

]
zam.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

zam_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Замки").id)
zam_tpz = Spree::OptionType.find_by!(name: 'Тип замка', taxon_id: Spree::Taxon.find_by(name: "Замки").id)
zam_tp = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Замки").id)

manufacturer_zam = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  zkteco: "ZKTeco",
  orbita: "Orbita",
  smartlock: "SmartLock",
  ci: "CISA"
}

zam_z = {
  el: "Електромеханічний",
  em: "Електромагнітний"
}
zam_x = {
  zam: "Замок",
  zas: "Защіпка",
  int: "Інт. Замок",
  kr: "Кріплення"
}

manufacturer_zam.each_with_index do |manufacturer, index|
  zam_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

zam_z.each_with_index do |manufacturer, index|
  zam_tpz.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

zam_x.each_with_index do |manufacturer, index|
  zam_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 14"
"=============================================================================================================================="
"=============================================================================================================================="
kn = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Кнопки").id,
    name: 'Тип',
    presentation: 'Тип',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Кнопки").id,
    name: 'Тип монтажу',
    presentation: 'Тип монтажу',
    position: 2
  }
]
kn.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

kn_t = Spree::OptionType.find_by!(name: 'Тип', taxon_id: Spree::Taxon.find_by(name: "Кнопки").id)
kn_m = Spree::OptionType.find_by!(name: 'Тип монтажу', taxon_id: Spree::Taxon.find_by(name: "Кнопки").id)

kn_tp = {
  kon: "Контактна",
  bezk: "Безконтактна"
}

kn_n = {
  nak: "Накладний",
  vr: "Врізний"
}

kn_tp.each_with_index do |manufacturer, index|
  kn_t.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

kn_n.each_with_index do |manufacturer, index|
  kn_m.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 15"
"=============================================================================================================================="
"=============================================================================================================================="
tyrnic = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id,
    name: 'Комплектуючі',
    presentation: 'Комплектуючі',
    position: 3
  }

]
tyrnic.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

tyrnic_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id)
tyrnic_tp = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id)
tyrnic_com = Spree::OptionType.find_by!(name: 'Комплектуючі', taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id)

manufacturer_tyrnic = {
  zkteco: "ZKTeco",
  gant: "Gant",
  nice: "Nice",
  proteco: "Proteco",
  roger: "Roger"
}

tp_tyrnic = {
  tyr: "Турнікет",
  sl: "Шлагбаум",
  av: "Автоматика на ворота"
}
comp_tyrnic = {
  pr: "Привід",
  ich: "ІЧ бар’єр",
  sp: "Лампа спалах",
  ker: "Керування",
  st: "Стріла",
  re: "Рейка"
}

manufacturer_tyrnic.each_with_index do |manufacturer, index|
  tyrnic_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_tyrnic.each_with_index do |manufacturer, index|
  tyrnic_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

comp_tyrnic.each_with_index do |manufacturer, index|
  tyrnic_com.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 16"
"=============================================================================================================================="
dot = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Дотягувачі").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Дотягувачі").id,
    name: 'Вага дотягування',
    presentation: 'Вага дотягування',
    position: 2
  }
]
dot.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_dot = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Дотягувачі").id)
dot_vag = Spree::OptionType.find_by!(name: 'Вага дотягування', taxon_id: Spree::Taxon.find_by(name: "Дотягувачі").id)

dot_manufacturer = {
  ry: "RYOBI",
  ci: "CISA"
}

dot_v = {
  v_65: 'До 65 кг',
  v_80: 'До 80 кг',
  d_100: 'До 100 кг'
}
dot_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_dot.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

dot_v.each_with_index do |manufacturer, index|
  dot_vag.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 17"
"=============================================================================================================================="
kart_brel = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Карти, брелоки").id,
    name: 'Тип',
    presentation: 'Тип',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Карти, брелоки").id,
    name: 'Протокол',
    presentation: 'Протокол',
    position: 2
  }
]
kart_brel.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

cart_tp = Spree::OptionType.find_by!(name: 'Тип', taxon_id: Spree::Taxon.find_by(name: "Карти, брелоки").id)
cart_pr = Spree::OptionType.find_by!(name: 'Протокол', taxon_id: Spree::Taxon.find_by(name: "Карти, брелоки").id)

cart_t = {
  car: "Карта",
  br: "Брелок",
  klch: "Ключ"
}

car_m = {
  em: 'EM Marine',
  mr: 'Mifare',
  ib: 'iButton',
  bl: 'Bluetooth'
}
cart_t.each_with_index do |manufacturer, index|
  cart_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

car_m.each_with_index do |manufacturer, index|
  cart_pr.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 18"
"=============================================================================================================================="
com = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Комутатори").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Комутатори").id,
    name: 'Кіл-сть портів',
    presentation: 'Кіл-сть портів',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Комутатори").id,
    name: 'Порти POE',
    presentation: 'Порти POE',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Комутатори").id,
    name: 'Порти SFP',
    presentation: 'Порти SFP',
    position: 4
  }
]
com.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_com = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Комутатори").id)
com_port = Spree::OptionType.find_by!(name: 'Кіл-сть портів', taxon_id: Spree::Taxon.find_by(name: "Комутатори").id)
com_poe = Spree::OptionType.find_by!(name: 'Порти POE', taxon_id: Spree::Taxon.find_by(name: "Комутатори").id)
com_pfs = Spree::OptionType.find_by!(name: 'Порти SFP', taxon_id: Spree::Taxon.find_by(name: "Комутатори").id)

com_manufacturer = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  micro: "MikroTik",
  ut: "UTEPO"
}

com_v = {
  v_5: '5-8',
  v_9: '9-14',
  v_18: '18-20',
  v_25: "25-36"
}
port_poe ={
  poe_4: "4",
  poe_8: "8",
  poe_16: "16",
  poe_24: "24",
  poe_0: "нема"
}
port_sfp ={
  s_1: "1",
  s_2: "2",
  s_4: "4",
  s_10: "10",
  s_16: "16",
  s_24:"24",
  s_0: "нема"
}

com_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_com.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

com_v.each_with_index do |manufacturer, index|
  com_port.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

port_poe.each_with_index do |manufacturer, index|
  com_poe.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

port_sfp.each_with_index do |manufacturer, index|
  com_pfs.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 19"
"=============================================================================================================================="
mar = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id,
    name: 'Кіл-сть портів',
    presentation: 'Кіл-сть портів',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id,
    name: 'Порти POE',
    presentation: 'Порти POE',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id,
    name: 'Порти SFP',
    presentation: 'Порти SFP',
    position: 4
  }
]
mar.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_mar = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id)
mar_port = Spree::OptionType.find_by!(name: 'Кіл-сть портів', taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id)
mar_poe_port = Spree::OptionType.find_by!(name: 'Порти POE', taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id)
mar_pfs = Spree::OptionType.find_by!(name: 'Порти SFP', taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id)

mar_manufacturer = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  micro: "MikroTik",
  ut: "UTEPO",
  link: "TP-Link"
}

mar_v = {
  v_5: '5-8',
  v_9: '9-14',
  v_18: '18-20',
  v_25: "25-36"
}
mar_poe ={
  poe_4: "4",
  poe_8: "8",
  poe_16: "16",
  poe_24: "24",
  poe_0: "нема"
}
mar_sfp ={
  s_1: "1",
  s_2: "2",
  s_4: "4",
  s_10: "10",
  s_16: "16",
  s_24:"24",
  s_0: "нема"
}

mar_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_mar.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

mar_v.each_with_index do |manufacturer, index|
  mar_port.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

mar_poe.each_with_index do |manufacturer, index|
  mar_poe_port.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

mar_sfp.each_with_index do |manufacturer, index|
  mar_pfs.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 20"
"=============================================================================================================================="
inz = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Інжектори, медіаконвертери").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Інжектори, медіаконвертери").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  }
]
inz.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_inz = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Інжектори, медіаконвертери").id)
inz_tp = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Інжектори, медіаконвертери").id)

inz_manufacturer = {
  dahua: "Dahua",
  ut: "UTEPO"
}

tp_inz = {
  inzec: 'Інжектор',
  med: 'Медіаконвертер',
  roz: 'Розгалужувач'
}

inz_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_inz.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_inz.each_with_index do |manufacturer, index|
  inz_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 21"
"=============================================================================================================================="
sygnal = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Передача сигналу").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Передача сигналу").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  }
]
sygnal.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_sygnal = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Передача сигналу").id)
sygnal_tp = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Передача сигналу").id)

sygnal_manufacturer = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  mic: "MikroTik",
  ut: "UTEPO"
}

tp_sygnal = {
  conv: 'Конвертер',
  mod: 'SFP модуль'
}

sygnal_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_sygnal.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_sygnal.each_with_index do |manufacturer, index|
  sygnal_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 22"
"=============================================================================================================================="
ppk = [
  {
    taxon_id: Spree::Taxon.find_by(name: "ППК").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "ППК").id,
    name: 'Тип підключення',
    presentation: 'Тип підключення',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "ППК").id,
    name: 'Елементи ППК',
    presentation: 'Елементи ППК',
    position: 3
  }
]
ppk.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_ppk = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "ППК").id)
ppk_typ = Spree::OptionType.find_by!(name: 'Тип підключення', taxon_id: Spree::Taxon.find_by(name: "ППК").id)
ppk_el = Spree::OptionType.find_by!(name: 'Елементи ППК', taxon_id: Spree::Taxon.find_by(name: "ППК").id)

ppk_manufacturer = {
  satel: "Satel",
  hikvision: "Hikvision",
  max: "Maks",
  ajax: "Ajax",
  jablotron: "Jablotron",
  orion: "Оріон",
  tipas: "Тірас"
}

ppk_tp = {
  drot: 'Дротовий',
  bez: 'Бездротовий'
}

ppk_el_pp ={
  com: "Комплект",
  box: "Бокс",
  plata: "Головна плата",
  clav: "Клавіатура",
  roz: "Розширювачі"
}

ppk_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_ppk.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

ppk_tp.each_with_index do |manufacturer, index|
  ppk_typ.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

ppk_el_pp.each_with_index do |manufacturer, index|
  ppk_el.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 23"

"=============================================================================================================================="
sp = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id,
    name: 'Тип підключення',
    presentation: 'Тип підключення',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id,
    name: 'Тип сповіщувача',
    presentation: 'Тип сповіщувача',
    position: 3
  }
]
sp.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_sp = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id)
sp_typ = Spree::OptionType.find_by!(name: 'Тип підключення', taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id)
sp_el = Spree::OptionType.find_by!(name: 'Тип сповіщувача', taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id)

sp_manufacturer = {
  satel: "Satel",
  hikvision: "Hikvision",
  max: "Maks",
  ajax: "Ajax",
  jablotron: "Jablotron",
  orion: "Оріон",
  tipas: "Тірас"
}

sp_tp = {
  drot: 'Дротовий',
  bez: 'Бездротовий'
}

sp_el_pp ={
  ryx: "Рух",
  ryxsh: "Рух (штора)",
  roz: "Розбиття",
  comb: "Комбінований",
  mag: "Магнітоконтакт",
  vib: "Вібро",
  ich: "ІЧ бар’єр",
  zatop: "Затоплення",
  pozez: "Пожежний"
}

sp_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_sp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

sp_tp.each_with_index do |manufacturer, index|
  sp_typ.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

sp_el_pp.each_with_index do |manufacturer, index|
  sp_el.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 24"
"=============================================================================================================================="
sr = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Сирени").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  }
]
sr.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_sr = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Сирени").id)

sr_manufacturer = {
  satel: "Satel",
  hikvision: "Hikvision",
  max: "Maks",
  ajax: "Ajax",
  jablotron: "Jablotron",
  orion: "Оріон",
  tipas: "Тірас"
}

sr_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_sr.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 25"
"=============================================================================================================================="
cabel = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Кабель").id,
    name: 'Тип кабелю',
    presentation: 'Тип кабелю',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Кабель").id,
    name: 'Екран',
    presentation: 'Екран',
    position: 2
  }
]
cabel.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_cabel = Spree::OptionType.find_by!(name: 'Тип кабелю', taxon_id: Spree::Taxon.find_by(name: "Кабель").id)
ekran_cabel = Spree::OptionType.find_by!(name: 'Екран', taxon_id: Spree::Taxon.find_by(name: "Кабель").id)

cabel_manufacturer = {
  cat: "CAT5E",
  sug: "Сигнальний",
  el: "Електричний",
  vg: "VGA",
  hd: "HDMI"
}
ek = {
  tac: "Так",
  ni: "Ні"
}

cabel_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_cabel.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

ek.each_with_index do |manufacturer, index|
  ekran_cabel.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 26"
"=============================================================================================================================="
block = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id,
    name: 'Підтримка АКБ',
    presentation: 'Підтримка АКБ',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id,
    name: 'Струм А',
    presentation: 'Струм А',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id,
    name: 'Тип живлення',
    presentation: 'Тип живлення',
    position: 3
  }
]
block.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_block = Spree::OptionType.find_by!(name: 'Підтримка АКБ', taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id)
ekran_block = Spree::OptionType.find_by!(name: 'Струм А', taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id)
block_tp = Spree::OptionType.find_by!(name: 'Тип живлення', taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id)

pid = {
  tac: "Так",
  ni: "Ні"
}

s_numb = {
  s_1: "1",
  s_3: "3",
  s_5: "5",
  s_10: "10",
  s_15: "15",
  s_20: "20"
}
acd = {
  ac: "АС",
  dc: "DC"
}

pid.each_with_index do |manufacturer, index|
  manufacturer_block.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

s_numb.each_with_index do |manufacturer, index|
  ekran_block.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

acd.each_with_index do |manufacturer, index|
  block_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 27"
"=============================================================================================================================="
acum = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Акумулятори").id,
    name: 'Ємність',
    presentation: 'Ємність',
    position: 1
  }
]
acum.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_acum = Spree::OptionType.find_by!(name: 'Ємність', taxon_id: Spree::Taxon.find_by(name: "Акумулятори").id)

acum_num = {
  a_1: "1 а/г",
  a_2: "2,2 а/г",
  a_4: "4,5 а/г",
  a_7: "7 а/г",
  a_18: "18 а/г"
}

acum_num.each_with_index do |manufacturer, index|
  manufacturer_acum.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 28"
"=============================================================================================================================="
roz_syg = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Передача, перетворення, розгалуження сигналу").id,
    name: 'Тип передачі',
    presentation: 'Тип передачі',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Передача, перетворення, розгалуження сигналу").id,
    name: 'Тип перетворення',
    presentation: 'Тип перетворення',
    position: 2
  }
]
roz_syg.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_roz_syg = Spree::OptionType.find_by!(name: 'Тип передачі', taxon_id: Spree::Taxon.find_by(name: "Передача, перетворення, розгалуження сигналу").id)
roz_syg_typ = Spree::OptionType.find_by!(name: 'Тип перетворення', taxon_id: Spree::Taxon.find_by(name: "Передача, перетворення, розгалуження сигналу").id)

roz_syg_num = {
  tvi: "TVI, CVI по UTP",
  vga: "VGA по UTP",
  hd: "HDMI по UTP",
  us: "USB по UTP",
  lan: "LAN по Coaxial"
}

tp_roz = {
  cv: "CVBS-VGA",
  hdm: "HDMI-VGA",
  vga: "VGA-HDMI",
  vgac: "VGA-CVBS",
  hdmi: "HDMI 1-2",
  hdm1: "HDMI 1-4",
  hdmi8: "HDMI 1-8"
}

roz_syg_num.each_with_index do |manufacturer, index|
  manufacturer_roz_syg.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_roz.each_with_index do |manufacturer, index|
  roz_syg_typ.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 29"
