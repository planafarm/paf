ActiveAdmin.register Product do
  permit_params :name, :is_active, :info

  index do
    selectable_column
    column :id
    column :name
    column :is_active
    column :family
    column :sub_sector
    column :sector
    actions
  end

  show do
    attributes_table do
      row :name
      row :sub_sector
      row :sector
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
end
