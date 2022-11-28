class MyproductDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegator :@view, :link_to, :catagories_subcatagories_product_path
  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Product.id", cond: :eq, orderable: true, searchable: false },
      name: { source: "Product.name", cond: :like, searchable: true, orderable: false },
      price: { source: "Product.price", cond: :like, searchable: true, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        price: record.price,
        show: link_to(record.name, catagories_subcatagories_product_path(record))
      }
    end
  end

  def get_raw_records
    # insert query here
    Product.all
  end

end
