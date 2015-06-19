RSpec::Matchers::define :have_content_in_order do |first_text, second_text|
  match do |page|
    page.has_content?(first_text) &&
      page.has_content?(second_text) &&
        page.text.index(first_text) < page.text.index(second_text)
  end
end
