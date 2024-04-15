dummy1 = Directory.create(name: 'Finance')
dummy2 = Directory.create(name: 'Healthcare')
dummy3 = Directory.create(name: 'Information Technology')
dummy4 = Directory.create(name: 'Legal')

dummy1.posts.create(
    title:'Monthly Budget',
    content: 'This is filler data for a companies\' potential monthly budget'
)

dummy1.posts.create(
    title:'Annual Budget',
    content: 'This is filler data for a companies\' potential annual budget'
)

dummy1.posts.create(
    title:'Investors',
    content: 'This is filler data for a companies\' potential current investors'
)

dummy2.posts.create(
    title:'Healthcare Plan',
    content: 'This is filler data for a companies\' potential healthcare prospects and current plan'
)

dummy2.posts.create(
    title:'Healthcare Trends',
    content: 'This is filler data for the current trends in healthcare for this occupation'
)

dummy3.posts.create(
    title:'IT FAQs',
    content: 'This is filler data for common technology troubleshooting'
)

dummy3.posts.create(
    title:'Technology Trends',
    content: 'This is filler data for advancements made in related technology'
)

dummy3.posts.create(
    title:'Current Issues',
    content: 'This is filler data technological issues a company may be facing'
)

dummy4.posts.create(
    title:'Legal FAQs',
    content: 'This is filler data for what questionable actions employees can take'
)

dummy4.posts.create(
    title:'Legal Team Info',
    content: 'This is filler data for the legal team a company has hired'
)

dummy4.posts.create(
    title:'Do\'s and Dont\'s',
    content: 'This is filler data for how to operate in the company'
)

admin = User.create(
    email: 'admin@email.com',
    password: 'password1',
    password_confirmation: 'password1',
    admin: true
)
