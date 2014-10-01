require 'spec_helper'
require './lib/person'


#rspec docs has its own human language..like "describe" and "do" , "it" etc

describe "Person" do
  let(:person) {Person.new( { full_name: "Amanda Raymond",
   age: 26, gender: "female", marital_status: "no" } ) }
  
describe "first_initial" do
  it "returns first letter of name" do
    # @user = User.new ( { first_name: "Amanda" } )
    expect(person.first_initial).to eq("A")
    end
  end
describe "first_name" do
  it "returns first name" do
    expect(person.first_name).to eq("Amanda")
  end
end

describe "last_name" do
  it "returns last name" do
    # @user = User.new( {full_name: "Amanda Raymond"})
    expect(person.last_name).to eq("Raymond")
  end
end
 
 describe "married?" do
  it "returns your marital status" do
    expect(person.married?).to eq(false)
  end
end

 describe "male?" do
  it "returns gender male" do
    expect(person.male?).to eq(false)
  end
end

 describe "female?" do
  it "returns gender female" do
    expect(person.female?).to eq(true)
  end
end

 describe "older_than_author?" do
  it "returns older than author" do
    expect(person.older_than_author?).to eq(false)
  end
end

 describe "younger_than_author?" do
  it "returns younger than author" do
    expect(person.younger_than_author?).to eq(false)
  end
end

describe "print_age_appropriate_sentence" do
  context "young?" do
    it "returns age appropriate sentence" do
      person = Person.new({full_name: "Amanda Raymond", age: 19})
      expected_message = "I can't believe you are so young!\n\n"
      expect(person.print_age_appropriate_sentence).to eq(expected_message)
    end
  end

  context "old?" do
    it "returns age appropriate sentence" do
      person = Person.new({age: 85})
      expected_message = "I bet you are a grandparent!\n\n"
      expect(person.print_age_appropriate_sentence).to eq(expected_message)
    end
  end
  
  context "" do
    it "returns age appropriate sentence" do
      expected_message = "You must be in your prime!\n\n"
      expect(person.print_age_appropriate_sentence).to eq(expected_message)
    end
  end
end

describe "print_age_compared_to_author" do
   context "older_than_author?" do
    it "returns age comparison" do
      person = Person.new({age: 85})
      expected_message = "It looks like you are older than me!!!\n\n"
      expect(person.print_age_compared_to_author).to eq(expected_message)
    end
  end

   context "younger_than_author?" do
    it "returns age comparison" do
      person = Person.new({ age: 19})
      expected_message = "It looks like you are younger than me!!\n\n"
      expect(person.print_age_compared_to_author).to eq(expected_message)
    end
  end
  
  context "" do
    it "returns age comparison" do
      expected_message = "You might be the same age as me!?\n\n"
     expect(person.print_age_compared_to_author).to eq(expected_message)
    end
  end
end

describe "nickname_sentence" do
   context "answer is yes" do
      it "returns nickname joke" do
        person.nickname_answer = "yes" #refers to setter method 
        expected_message = "Okay \"The Dude\" it is... I was going to just call #{person.first_initial} but it doesnt seem to fit!\n\n"
        expect(person.nickname_sentence).to eq(expected_message)
      end
    end

  context "answer is no" do
    it "returns nickname joke" do
      person.nickname_answer = "no"
      expected_message = "Well #{person.first_name} I am going to call you \"The Dude\" anyways..."
      expect(person.nickname_sentence).to eq(expected_message)
    end
  end

  context "answer is maybe" do
    it "returns nickname joke" do
      person.nickname_answer = "maybe"
      expected_message = "This is so like you \"The Dude\", not being able to decide...and to think I almost called you #{person.first_initial}.\n\n"
      expect(person.nickname_sentence).to eq(expected_message)
    end
  end

  context "answer is other" do
    it "returns nickname joke" do
      person.nickname_answer = ""
      expected_message = "You are being such a dude so I am going to call you \"the Dude\"\n\n"
      expect(person.nickname_sentence).to eq(expected_message)
    end
  end
end
 

describe "more_questions_statement" do
  it "tells user about more questions'" do
    expected_message = "Sooo #{person.nickname}, I am going to ask you a few more questions if you don't mind?...\n\n"
    expect(person.more_questions_statement).to eq(expected_message)
  end
end

end





