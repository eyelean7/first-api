class Seed

  def self.begin
    seed = Seed.new
    seed.generate_groups_and_messages
  end

  def generate_groups_and_messages

    # 5.times do |i|
    #   Group.create!(
    #     name: Faker::Company.name
    #   )
    # end

    all_groups = Group.all.order('id')
    all_groups_ids = Array.new
    all_groups.each() do |group|
      all_groups_ids.push(group.id)
    end

    5.times do |i|
      lowest = all_groups_ids[0]
      highest = all_groups_ids[4]
      message = Message.create!(
        author: Faker::StarWars.character,
        content: Faker::Simpsons.quote,
        group_id: Faker::Number.between(lowest, highest)
      )
      puts "Message #{i}: Group is #{message.group}, author is #{message.author}, and message is '#{message.content}'."
    end
  end
end

Seed.begin
