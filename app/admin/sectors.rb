ActiveAdmin.register Sector do
  permit_params :name, :is_active
  config.sort_order = "id_asc"
  menu priority: 3

  index do
    selectable_column
    column :id
    column :name
    column :is_active
    actions
  end
end
