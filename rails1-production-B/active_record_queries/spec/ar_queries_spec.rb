require 'rspec'
require 'rails_helper'
require 'spec_helper'

require_relative '../problems/ar_queries.rb'

describe 'god_father_movies' do
	subject { god_father_movies.as_json }
	
	let(:expected_result) {
		[
			{ id: 12, title: "Godfather, The", yr: 1972 },
			{ id: 61, title: "Godfather: Part II, The", yr: 1974 },
			{ id: 437, title: "Godfather: Part III, The", yr: 1990 }
		].map{ |el| el.stringify_keys }
	}

  it 'retrieves the correct information' do
    expect(subject).to contain_exactly(*expected_result)
  end
	
  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
		expect(subject).to contain_exactly(*expected_result)
  end
end

describe 'michelle_movies' do
	subject { michelle_movies.as_json }

	let(:expected_result) {
		[
			{"id"=>281, "title"=>"Dangerous Liaisons", "yr"=>1988},
			{"id"=>350, "title"=>"Scarface", "yr"=>1983},
			{"id"=>506, "title"=>"Prince of Egypt, The", "yr"=>1998},
			{"id"=>856, "title"=>"Age of Innocence, The", "yr"=>1993},
			{"id"=>429, "title"=>"What Lies Beneath", "yr"=>2000},
			{"id"=>1012, "title"=>"Fabulous Baker Boys, The", "yr"=>1989},
			{"id"=>1035, "title"=>"Midsummer Night's Dream, A", "yr"=>1999},
			{"id"=>1284, "title"=>"Frankie and Johnny", "yr"=>1991},
			{"id"=>493, "title"=>"Witches of Eastwick, The", "yr"=>1987},
			{"id"=>748, "title"=>"One Fine Day", "yr"=>1996},
			{"id"=>205, "title"=>"Batman Returns", "yr"=>1992},
			{"id"=>1644, "title"=>"Russia House, The", "yr"=>1990},
			{"id"=>1546, "title"=>"Deep End of the Ocean, The", "yr"=>1999},
			{"id"=>802, "title"=>"Wolf", "yr"=>1994},
			{"id"=>1239, "title"=>"Up Close & Personal", "yr"=>1996},
			{"id"=>970, "title"=>"Tequila Sunrise", "yr"=>1988},
			{"id"=>894, "title"=>"Dangerous Minds", "yr"=>1995},
			{"id"=>1115, "title"=>"Story of Us, The", "yr"=>1999},
			{"id"=>1845, "title"=>"Hollywood Knights, The", "yr"=>1980},
			{"id"=>1275, "title"=>"Amazon Women on the Moon", "yr"=>1987},
			{"id"=>1024, "title"=>"Grease 2", "yr"=>1982}
		]
	}

  it 'retrieves the correct information' do
    expect(subject).to eq(expected_result)
  end
	
  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
		expect(subject).to eq(expected_result)
  end
end

describe 'actor_ids_from_blade_runner' do
	subject { actor_ids_from_blade_runner }

	it 'retrieves the correct information' do
		expect(subject).to contain_exactly(
			6, 437, 515, 591, 1005, 1100, 1145, 1344, 1450, 3379
    )
	end
	
	it 'hits the database exactly once' do
		expect{ subject }.to make_database_queries(count: 1)
		expect(subject).to contain_exactly(
			6, 437, 515, 591, 1005, 1100, 1145, 1344, 1450, 3379
		)
	end
end

describe 'best_years' do
	subject { best_years }
	
	let(:expected_result) {
		[
			1943,
			1935,
			1934,
			1933,
			1930,
			1922,
			1936,
			1939,
			1938,
			1925,
			1929,
			1927,
			1952
		]
	}

  it 'retrieves the correct information' do
    expect(subject).to contain_exactly(*expected_result)
  end
	
  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
		expect(subject).to contain_exactly(*expected_result)
  end
end

describe 'harrying_times' do
	subject { harrying_times }
	
	let(:expected_result) { [1988, 1997] }

  it 'retrieves the correct information' do
    expect(subject).to contain_exactly(*expected_result)
  end
	
  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
		expect(subject).to contain_exactly(*expected_result)
  end
end