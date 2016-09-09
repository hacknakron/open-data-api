require 'csv'

class FileImporter
  def import_file(file_path)
    csv_text = File.read(file_path)

    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      CommunityLearningCenter.create(
        school_name: row['School'],
        address: row['Address'],
        gym_1: row['Gym 1'],
        gym_2: row['Gym 2'],
        gym_3: row['Gym 3'],
        auditorium: row['Auditorium'],
        cafeteria: row['Cafeteria'],
        lrc: row['LRC'],
        music: row['Music'],
        art: row['Art'],
        classroom: row['Classroom'])
    end
  end

private

end
