# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

1.upto(10) do |id|
  ViewAkronWard.create!(wardnumber: 1,
                        wardname: 'foo',
                        wardobjectid: id,
                        wardcode: 'bar',
                        totalpopulation: 175,
                        deviationfromaverage: 5,
                        deviationfromaveragepercent: 5.5,
                        whitepopulation: 1,
                        whitepopulationpercent: 5.5,
                        blackpopulation: 1,
                        blackpopulationpercent: 5.5,
                        hispanicpopulation: 1,
                        hispanicpopulationpercent: 5.5,
                        councilperson: 'baz',
                        councilpersonweblink: 'asdf',
                        wardglobalid: SecureRandom.hex,
                        wardshape_starea: 1.1,
                        wardshape_stlength: 2.2)

end
