require 'redmine'

Rails.logger.info('Starting enumeration custom field plugin for Redmine')


require_dependency('customfields')

pc = ProjectCustomField.find_by(name: "Project Category")
unless pc
  pc = ProjectCustomField.new()
  pc.name = "Project Category"
  pc.is_required = true
  pc.is_filter = true
  pc.is_for_all = true
  pc.description = "Project Category Enumeration"
  pc.field_format = "projectcategoryenumeration"
  pc.multiple = true
  begin
    pc.save()
  rescue => e
    Rails.logger.error(e)
  end

end

pt = ProjectCustomField.find_by(name: "Project Type")
unless pt
  pt = ProjectCustomField.new()
  pt.name = "Project Type"
  pt.is_required = true
  pt.is_filter = true
  pt.is_for_all = true
  pt.description = "Project Type Enumeration"
  pt.field_format = "projecttypeenumeration"
  begin
    pt.save()
  rescue => e
    Rails.logger.error(e)
  end

end


Redmine::Plugin.register :redmine_project_categories_types do
  name 'Project Category/Type Plugin'
  author 'Kazım SARIKAYA'
  description 'This plugin provides project category and type support'
  version '0.0.1'
  url 'https://github.com/kazimsarikaya/redmine_project_categories_types'
  author_url 'https://srkykzm.com/about'
end
