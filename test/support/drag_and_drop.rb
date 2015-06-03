module CapybaraExtension
  def drag_by(right_by, down_by)
    base.drag_by(right_by, down_by)
  end
end

module CapybaraSeleniumExtension
  def drag_by(right_by, down_by)
    driver.browser.action.drag_and_drop_by(native, right_by, down_by).perform

    ## [DEPRECATED] For Capybara 1
    # resynchronize { driver.browser.action.drag_and_drop_by(native, right_by, down_by).perform }
  end
end

::Capybara::Selenium::Node.send :include, CapybaraSeleniumExtension
::Capybara::Node::Element.send :include, CapybaraExtension

def drag_top_to_bottom(row_css, options = {})
  adjust_x = options[:adjust_x] || 1
  adjust_y = options[:adjust_y] || -1
  offset_y = all(row_css).last.native.location.y - all(row_css).first.native.location.y
  height = evaluate_script("$('#{row_css}').height()")
  first(row_css).drag_by(adjust_x, offset_y + height + adjust_y)
end
