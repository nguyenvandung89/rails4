module CustomViewHelper
  include ComparePath
  def requirement_label model, field
    is_required = model.class.validators_on(field).map(&:class)
      .any? do |klass|
        [ActiveModel::Validations::PresenceValidator,
         ActiveModel::Validations::InclusionValidator].include? klass
      end
    prefix = is_required ? "" : "not_"
    type, text = %w(type text).map do |item|
      t "viewhelper.requirement.#{item}.#{prefix}required"
    end
    render partial: "shared/components/label", locals: {type: type, text: text}
  end

  def link_to_tab(name, link, opts = {})
    if compare_path(request.path_info, link)
      opts[:class] = %W(active) << opts[:class].try(:split)
    end
    link_to(name, link, opts)
  end
  
  def link_to_shop_tab(name, link, target, opts = {})
    if compare_path(request.path_info, link) && params[:target] == target
      opts[:class] = %W(active) << opts[:class].try(:split)
    end
    link_to(name, link, opts)
  end

  def link_to_staff_index_tab(name, link, opts = {})
    if compare_path(request.path_info, link) && params[:set_attendances].nil? &&
      params[:action] == "index"
      opts[:class] = %W(active) << opts[:class].try(:split)
    end
    link_to(name, link, opts)
  end

  def link_to_staff_new_tab(name, link, opts = {})
    if compare_path(request.path_info, link) && (params[:action] == "new" ||
      params[:action] == "create")
      opts[:class] = %W(active) << opts[:class].try(:split)
    end
    link_to(name, link, opts)
  end

  def link_to_tab_with_image(img_name, img_postfix, img_opts, link, opts = {})
    if compare_path(request.path_info, link)
      img_opts[:class] = %W(imgLinkActive) << img_opts[:class].try(:split)
      img_name = img_name.gsub(%r((\.gif|\.jpg|\.png)$), img_postfix) << "#{$1}"
    end
    link_to(image_tag(img_name, img_opts), link, opts)
  end

  def li_with_active_link(text, link, link_opts = {})
    if ((request.path_info == link && !params[:target]) || (request.fullpath == link && params[:target]))
      content_tag :li, text, class: %W(tabOn)
    else
      content_tag :li do
        link_to text, link, link_opts
      end
    end
  end

  def append_fields object, *fields
    responded_fields = fields & object.methods
    html = ""
    responded_fields.each do |field|
      html << render("manage/components/append_field_shop",
        label: object.class.h(field.to_sym),
        content: object.try(field).try(:html_safe))
    end
    html.html_safe
  end

  def append_field_if_exist object, *fields
    responded_fields = fields & object.methods
    html = ""
    responded_fields.each do |field|
      content = object.try(field)
      if content.present?
        html << render("manage/components/append_field_shop",
          label: object.class.h(field.to_sym), content: content.html_safe)
      end
    end
    html.html_safe
  end

  def list_dates number_of_dates
    render partial: "shared/components/list_date", locals: {number_of_dates: number_of_dates}
  end

  def number_to_yen number
    number_to_currency number, unit: "&yen", format: "%u%n", precision: 0
  end

  def day_in_week week, day
    day_index = week.map {|t| t[0].wday}.index(day)
    return if day_index.nil?
    render "day_info", day: week[day_index][0],
      attend_count: week[day_index][1].try(:first).try(:attendances).try(:count)
  end

  def today_class_for_current_day xweek, index
    week = xweek.map {|t| t[0]}
    return unless week.include? Time.zone.now.to_date
    return "today" if index == Time.zone.now.to_date.wday
  end
  
  def today_class_for_current_attendance xweek, index
    week = xweek.map {|t| t.date}
    return unless week.include? Time.zone.now.to_date
    return "today" if index == Time.zone.now.to_date.wday
  end

  def attendances_in_week week, day, form
    day_index = week.map{|a| a.date.wday}.index(day)
    return if day_index.nil?
    render "day_info", attendance: week[day_index], form: form
  end

  def jp_h2_tag label
    content_tag :h2, label, style: "background-color: #f70; color: #fff; text-align: center; padding: 2px 0; border-top: solid 1px #f70; font-size: 12px"
  end

  def jp_h3_tag label
    content_tag :h3, label, style: "background-color: #f70; color: #fff; text-align: center; padding: 2px 0; border-top: solid 1px #f70; font-size: 12px"
  end

  def jp_h4_tag label
    content_tag :h4, label, style: "color: #f70; border-bottom: 1px solid #f70; margin: 0"
  end
end
