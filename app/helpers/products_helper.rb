module ProductsHelper
    def options_for_subcatagory
      Subcatagory.all.collect { |m| [m.name,m.id]}
    end
    def options_for_catagory
      Catagory.all.collect { |m| [m.name,m.id]}
    end
end
