class MyproductDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Product.id", cond: :eq, orderable: false, searchable: false },
      name: { source: "User.name", cond: :like,searchable: true, orderable: false },
      price: { source: "Product.price", cond: :like,searchable: true, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        price: record.price
      }
    end
  end

  def get_raw_records
    # insert query here
    Product.all
  end

end
