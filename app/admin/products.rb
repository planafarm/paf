ActiveAdmin.register Product do
  permit_params :name, :is_active, :info
  menu parent: "Sectors", priority: 4

  index do
    selectable_column
    column :id
    column :name
    column :is_active
    column :sector
    column :sub_sector
    column :family
    actions
  end

  show do
    attributes_table do
      row :name
      row :sector
      row :sub_sector
      row :family
      row :is_active
      row :info do |e|
        input(value: e.info, class: "jsoneditor-view")
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :is_active
      f.input :info, as: :text, input_html: { class: "jsoneditor-edit" }
    end
    f.actions
  end

  filter :sector
  filter :sub_sector
  filter :family
  filter :name
  filter :is_active
end
