ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation,
                :first_name, :last_name, :avatar

  index do
    selectable_column
    id_column
    column 'Avatar' do |admin_user|
      if admin_user.avatar.attached?
        image_tag url_for(admin_user.avatar), width: 48, height: 48
      else
        image_tag image_path('profile.jpg'), width: 48, height: 48
      end
    end
    column 'Name' do |admin_user|
      link_to "#{admin_user.first_name} #{admin_user.last_name}", admin_admin_user_path(admin_user)
    end
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :avatar, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :avatar do |admin_user|
        if admin_user.avatar.attached?
          image_tag url_for(admin_user.avatar), width: 48, height: 48
        else
          image_tag image_path('profile.jpg'), width: 48, height: 48
        end
      end
      row :first_name
      row :last_name
      row :email
      row :created_at
      row :updated_at
    end
  end

end
