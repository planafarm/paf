ActiveAdmin.register SubSector do
  permit_params :name, :is_active
  config.sort_order = "id_asc"
  menu priority: 4

  index do
    selectable_column
    column :id
    column :name
    column :is_active
    column :sector
    actions
  end
end
