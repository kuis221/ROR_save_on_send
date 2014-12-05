class Page
  PAGES = {
    en: {
      how_to: 'how_to_en.html.slim'
    },
    es: {
      how_to: 'how_to_es.html.slim'
    }
  }

  def self.get_template(id)
    "pages/#{(PAGES[I18n.locale] || PAGES[:en])[id.to_sym]}"
  end
end
