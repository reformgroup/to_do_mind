module ApplicationHelper
  
  LOCALE_LIST = { en: 'English', ru: 'Русский' }
  
  def current_locale_name
    LOCALE_LIST[I18n.locale]
  end
  
  def locale_list
    LOCALE_LIST
  end
  
  # Returns the base name.
  def base_name
    'To do mind'
  end
  
  # Returns the full title on a per-page basis.
  def full_title(page_title = nil)
    if page_title.empty?
      base_name
    else
      page_title + ' | ' + base_name
    end
  end
end
