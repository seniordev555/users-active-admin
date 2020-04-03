ActiveAdmin.register Book do
  menu parent: 'BookStore'

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :price, :author, :genre_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :price, :author, :genre_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index as: :block do |book|
    div for: book, class: 'book-item' do
      resource_selection_cell book
      a href: admin_book_path(book), class: 'book-img' do
        img src: url_for(book.image.variant(combine_options: { resize: '200x282^', gravity: 'center', extent: '200x282' }))
        h2 book.title
      end
    end
  end

  filter :title
  filter :genre
  filter :price
  filter :author

  form do |f|
    f.inputs do
      f.input :title
      f.input :genre
      f.input :price
      f.input :author
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :image do |book|
        image_tag url_for(url_for(book.image.variant(combine_options: { resize: '200x282^', gravity: 'center', extent: '200x282' })))
      end
      row :title
      row :genre
      row :price
      row :author
      row :created_at
      row :updated_at
    end
  end

end
