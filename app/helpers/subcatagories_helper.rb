module SubcatagoriesHelper
    def options_for_catagory
       Catagory.all.collect { |m| [m.name,m.id]}
    end
end
