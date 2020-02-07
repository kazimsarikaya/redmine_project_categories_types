class ProjectCategoryEnumerationFormat < Redmine::FieldFormat::RecordList
  add("projectcategoryenumeration")

  def label
    :label_custom_enumeration_project_category
  end

  def target_class
    @target_class = ProjectCategory
  end

  def possible_values_options(custom_field, object=nil)
    ProjectCategory.active.map{|item| [item.name, item.id.to_s]}
  end
end

class ProjectTypeEnumerationFormat < Redmine::FieldFormat::RecordList
  add("projecttypeenumeration")

  def label
    :label_custom_enumeration_project_type
  end

  def target_class
    @target_class = ProjectType
  end

  def possible_values_options(custom_field, object=nil)
    ProjectType.active.map{|item| [item.name, item.id.to_s]}
  end
end
