require 'csv'

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
Spree::Store.last.update_attributes(default_currency: Spree::Config[:currency])
Spree::Role.create(name: "rozdrib")
Spree::Role.create(name: "opt")
Spree::Role.create(name: "gold")
Spree::Role.create(name: "vip")
Spree::Role.create(name: "vip2")
Spree::Role.create(name: "vip1")
Spree::Role.find_by(name: "user").destroy

CSV.foreach("db/taxonomy.csv", headers: true)do |property|
Spree::Taxonomy.create! property.to_h
end
p "Taxonomy"

6.times do |t|
CSV.foreach("db/taxon_#{t+1}.csv", headers: true)do |taxon|
tax = Spree::Taxon.new(taxon.to_h)
  tax.update(taxonomy_id:Spree::Taxonomy.find("#{t+1}").id, parent_id: Spree::Taxonomy.find("#{t+1}").id)
    tax.save!
end
end
p "Taxons"


CSV.foreach("db/products_test.csv", headers: true)do |product|
Spree::Product.create! product.to_h
end

p "products"

option_types_attributes_camery = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Тип камери',
    presentation: 'Тип камери',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Роздільна Здатність',
    presentation: 'Роздільна Здатність',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Форм фактор',
    presentation: 'Форм фактор',
    position: 4
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: "Тип обʼєктива",
    presentation: "Тип обʼєктива",
    position: 5
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Дальність підсвітки',
    presentation: 'Дальність підсвітки',
    position: 6
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Ступінь захисту',
    presentation: 'Ступінь захисту',
    position: 7
  },
]

option_types_attributes_camery.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

option_types_attributes_ptz = [
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Тип камери',
    presentation: 'Тип камери',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Роздільна Здатність',
    presentation: 'Роздільна Здатність',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Форм фактор',
    presentation: 'Форм фактор',
    position: 4
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: "Тип обʼєктива",
    presentation: "Тип обʼєктива",
    position: 5
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Дальність підсвітки',
    presentation: 'Дальність підсвітки',
    position: 6
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Ступінь захисту',
    presentation: 'Ступінь захисту',
    position: 7
  },
]

option_types_attributes_ptz.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

"=============================================================================================================================="
manufacturer_option_type_camera = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
type_cam_option_type_camera = Spree::OptionType.find_by!(name: 'Тип камери', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
roz_ability_option_type_camera = Spree::OptionType.find_by!(name: 'Роздільна Здатність', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
form_option_type_camera = Spree::OptionType.find_by!(name: 'Форм фактор', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
object_option_type_camera = Spree::OptionType.find_by!(name: "Тип обʼєктива", taxon_id: Spree::Taxon.find_by(name: "Камери").id)
light_option_type_camera = Spree::OptionType.find_by!(name: 'Дальність підсвітки', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
grade_option_type_camera = Spree::OptionType.find_by!(name: 'Ступінь захисту', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
"=============================================================================================================================="
manufacturer_option_type_ptz = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
type_cam_option_type_ptz = Spree::OptionType.find_by!(name: 'Тип камери', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
roz_ability_option_type_ptz = Spree::OptionType.find_by!(name: 'Роздільна Здатність', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
form_option_type_ptz = Spree::OptionType.find_by!(name: 'Форм фактор', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
object_option_type_ptz = Spree::OptionType.find_by!(name: "Тип обʼєктива", taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
light_option_type_ptz = Spree::OptionType.find_by!(name: 'Дальність підсвітки', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
grade_option_type_ptz = Spree::OptionType.find_by!(name: 'Ступінь захисту', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)

"=============================================================================================================================="
manufacturer = { dahua: "Dahua", hikvision: "Hikvision", ezviz: "EZVIZ", imou: "IMOU"}

type = {
  ip: 'IP',
  tvi: 'TVI',
  cvi: 'CVI',
  analogovi: 'Аналогові',
  panavu: 'PanaVu',
  ekshen: 'Екшн'
}

roz_ab = {
  mp_1: "1 МП",
  mp_2: "2 МП",
  mp_3: "3 МП",
  mp_4: "4 МП",
  mp_5: "5 МП",
  mp_6: "6 МП",
  mp_8: "8 МП",
  mp_12: "12 МП",
  mp_16: "16 МП",
  mp_18: "18 МП",
  mp_24: "24 МП"
}

form = {
  bezcorpusni: "Безкорпусні",
  cub: "Куб",
  corpusna_bullet: "Корпусна (bullet)",
  cupolna: "Купольна",
  pid_object: "Під об'єктив"
}

type_object = {
  fixovanuy: "Фіксований",
  var: "Варіофокальний",
  moto: "Моторизований",
  oko: "Риб'яче око",
  bez_object: "Без об'єктиву"
}
light = {
  m_30: "До 30 м",
  m_30_80: "30-80 м",
  m_100_400: "100-400 м",
  m_400_800: "400-800 м"
}
protection = {
  ip_54: "IP54",
  ip_65: "IP65",
  ip_66: "IP66",
  ip_67: "IP67",
  ik_7: "IK7",
  ik_8: "IK8",
  ik_10: "IK10",
  vnutrishni: "Внутрішні"
}
"=============================================================================================================================="
manufacturer.each_with_index do |manufacturer, index|
  manufacturer_option_type_camera.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

type.each_with_index do |characteristic, index|
  type_cam_option_type_camera.option_values.find_or_create_by!(
    name: characteristic.first,
    presentation: characteristic.last,
    position: index + 1
  )
end

roz_ab.each_with_index do |specific, index|
  roz_ability_option_type_camera.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

form.each_with_index do |color, index|
  form_option_type_camera.option_values.find_or_create_by!(
    name: color.first,
    presentation: color.last,
    position: index + 1
  )
end

type_object.each_with_index do |specific, index|
  object_option_type_camera.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

light.each_with_index do |specific, index|
  light_option_type_camera.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

protection.each_with_index do |specific, index|
  grade_option_type_camera.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end
"=============================================================================================================================="
manufacturer.each_with_index do |manufacturer, index|
  manufacturer_option_type_ptz.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

type.each_with_index do |characteristic, index|
  type_cam_option_type_ptz.option_values.find_or_create_by!(
    name: characteristic.first,
    presentation: characteristic.last,
    position: index + 1
  )
end

roz_ab.each_with_index do |specific, index|
  roz_ability_option_type_ptz.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

form.each_with_index do |color, index|
  form_option_type_ptz.option_values.find_or_create_by!(
    name: color.first,
    presentation: color.last,
    position: index + 1
  )
end

type_object.each_with_index do |specific, index|
  object_option_type_ptz.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

light.each_with_index do |specific, index|
  light_option_type_ptz.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

protection.each_with_index do |specific, index|
  grade_option_type_ptz.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end
p "option type 1"
"=============================================================================================================================="
option_types_attributes_reestrator = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Тип реєстратора',
    presentation: 'Тип реєстратора',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Аналогові канали',
    presentation: 'Аналогові канали',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'ІРС канали',
    presentation: 'ІРС канали',
    position: 4
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Максимальний Запис',
    presentation: 'Максимальний Запис',
    position: 5
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Кількість HDD',
    presentation: 'Кількість HDD',
    position: 6
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Аудіо входи',
    presentation: 'Аудіо входи',
    position: 7
  }
]
option_types_attributes_reestrator.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_option_type_reestrator = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
type_cam_option_type_camera = Spree::OptionType.find_by!(name: 'Тип реєстратора', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
canal_option_type_reestrator = Spree::OptionType.find_by!(name: 'Аналогові канали', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
ipc_option_type_camera = Spree::OptionType.find_by!(name: 'ІРС канали', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
zapus_option_type_reestrator = Spree::OptionType.find_by!(name: 'Максимальний Запис', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
hdd_option_type_reestrator = Spree::OptionType.find_by!(name: 'Кількість HDD', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
audio_option_type_reestrator = Spree::OptionType.find_by!(name: 'Аудіо входи', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)


manufacturer_reestrator = { dahua: "Dahua", hikvision: "Hikvision"}

type_cam = {
  nvr: 'NVR',
  hdcvi: 'HDCVI',
  turbo: 'TurboHD',
  hd_sdi: 'HD-SDI',
  analogovuy: 'Аналоговий'
}
canal = {
  c_4: '4',
  c_8: '8',
  c_16: '16',
  c_24: '24',
  c_32: '32'
}

ip = {
  c_1: '1',
  c_2: '2',
  c_4: '4',
  c_6: '6',
  c_8: '8',
  c_16: '16',
  c_32: '32',
  c_64: '64',
  c_128: '128',
  c_256: '256'
}

max = {
  mp_4: 'до 4Мп',
  mp_5: 'до 5Мп',
  mp_6: 'до 6Мп',
  mp_8: 'до 8Мп',
  mp_12: 'до 12Мп',
  mp_16: 'до 16Мп'
}

hdd = {
  hdd_1: '1',
  hdd_2: '2',
  hdd_4: '4',
  hdd_8: '8',
  hdd_16: '16',
  hdd_24: '24'
}

audio = {
  audio_1: '1',
  audio_4: '4',
  audio_8: '8',
  audio_16: '16',
  audio_vid: 'Відсутні'
}

manufacturer_reestrator.each_with_index do |manufacturer, index|
  manufacturer_option_type_reestrator.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

type_cam.each_with_index do |manufacturer, index|
  type_cam_option_type_camera.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

canal.each_with_index do |manufacturer, index|
  canal_option_type_reestrator.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

ip.each_with_index do |manufacturer, index|
  ipc_option_type_camera.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

max.each_with_index do |manufacturer, index|
  zapus_option_type_reestrator.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

hdd.each_with_index do |manufacturer, index|
  hdd_option_type_reestrator.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

audio.each_with_index do |manufacturer, index|
  audio_option_type_reestrator.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 2"
"=============================================================================================================================="
option_types_attributes_cron = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Кронштейни").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Кронштейни").id,
    name: 'Тип',
    presentation: 'Тип',
    position: 2
  }
]
option_types_attributes_cron.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_option_type_cron = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Кронштейни").id)
type_option_type_cron = Spree::OptionType.find_by!(name: 'Тип', taxon_id: Spree::Taxon.find_by(name: "Кронштейни").id)

manufacturer_cron = { dahua: "Dahua", hikvision: "Hikvision", zj: "ZJ"}

type_cron = {
  box: 'Розп. Коробки',
  zyvlennja: 'Під блоки живлення',
  stina: 'На стіну',
  stelja: 'На стелю',
  stovp: 'Кріплення на стовп',
  adapt: 'Адаптери',
  cojuh: 'Кожухи',
  vynosni: 'Виносні',
  kytovi: 'Кутові'
}
manufacturer_cron.each_with_index do |manufacturer, index|
  manufacturer_option_type_cron.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

type_cron.each_with_index do |manufacturer, index|
  type_option_type_cron.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 3"
"=============================================================================================================================="
option_types_attributes_acum = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id,
    name: 'Тип',
    presentation: 'Тип',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id,
    name: 'Ємність',
    presentation: 'Ємність',
    position: 3
  }
]
option_types_attributes_acum.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_option_type_acum = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id)
type_option_type_acum = Spree::OptionType.find_by!(name: 'Тип', taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id)
em_option_type_acum = Spree::OptionType.find_by!(name: 'Ємність', taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id)

manufacturer_acum = { hikvision: "Hikvision", seagate: "Seagate", w_digital: "Western Digital"}

type_acum = {
  hdd: 'HDD',
  micro: 'microSD'
}
em = {
  gb_16: '16Гб',
  gb_32: '32Гб',
  gb_64: '64Гб',
  t_1: '1Тб',
  t_2: '2Тб',
  t_3: '3Тб',
  t_4: '4Тб ',
  t_6: '6Тб ',
  t_8: '8Тб '
}
manufacturer_acum.each_with_index do |manufacturer, index|
  manufacturer_option_type_acum.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

type_acum.each_with_index do |manufacturer, index|
  type_option_type_acum.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

em.each_with_index do |manufacturer, index|
  em_option_type_acum.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 4"
"=============================================================================================================================="
option_types_attributes_mic = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Зовнішні мікрофони").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  }
]
option_types_attributes_mic.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_option_type_mic = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Зовнішні мікрофони").id)

manufacturer_mic = { dahua: "Dahua", hikvision: "Hikvision"}

manufacturer_mic.each_with_index do |manufacturer, index|
  manufacturer_option_type_mic.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 5"
"=============================================================================================================================="
option_types_attributes_pult = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Пульти керування").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Пульти керування").id,
    name: 'Інтерфейси',
    presentation: 'Інтерфейси',
    position: 2
  }
]
option_types_attributes_pult.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_option_type_pult = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Пульти керування").id)
type_option_type_pult = Spree::OptionType.find_by!(name: 'Інтерфейси', taxon_id: Spree::Taxon.find_by(name: "Пульти керування").id)

manufacturer_pult = { dahua: "Dahua", hikvision: "Hikvision"}

inter = {
  lan: 'Lan',
  rs: 'RS-485 & RS-232',
  usb: 'USB'
}
manufacturer_pult.each_with_index do |manufacturer, index|
  manufacturer_option_type_pult.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

inter.each_with_index do |manufacturer, index|
  type_option_type_pult.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 6"
"=============================================================================================================================="
