ActiveAdmin.register Sector do
  permit_params :name, :is_active, :info
  menu parent: "Sectors"

  index do
    selectable_column
    column :id
    column :name
    column :is_active
    actions
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
