FactoryGirl.define do
  factory :attribute, class: Hash do
    external_id 1
    foo :bar

    initialize_with { attributes }
  end

  factory :event, class: Hash do
    external_id 1
    name :baz
    time Time.now

    initialize_with { attributes }
  end

  factory :purchase, class: Hash do
    external_id 1
    product_id 1
    time Time.now
    currency 'CAD'
    price 1.0

    initialize_with { attributes }
  end

  factory :messages, class: Hash do
    apple_push({ alert: :hello })

    initialize_with { attributes }
  end
end
