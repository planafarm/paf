ActiveAdmin.register Entry do
  permit_params :agent, :index, :sector, :sub_sector, :family, :product, :data
  menu priority: 1

  index do
    selectable_column
    column :id
    column :agent
    column :supplier
    column :index
    column :sector
    column :sub_sector
    column :family
    column :product
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :agent
      row :supplier
      row :index
      row :sector
      row :sub_sector
      row :family
      row :product
      row :data do |e|
        input(value: e.data, class: "jsoneditor-view")
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Details" do
      f.input :agent
      f.input :index
      f.input :sector
      f.input :sub_sector
      f.input :family
      f.input :product
      f.input :data, as: :text, input_html: { class: "jsoneditor-edit" }
    end
    f.actions
  end
end
