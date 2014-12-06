class Page
  PAGES = {
    'en' => {
      how_to: 'how_to_en.html.slim'
    },
    'es' => {
      how_to: 'how_to_es.html.slim'
    },
    'zh-CN' => {
      how_to: 'how_to_zh_cn.html.slim'
    }
  }

  def self.get_template(id)
    "pages/#{(PAGES[I18n.locale.to_s] || PAGES[:en])[id.to_sym]}"
  end
end
