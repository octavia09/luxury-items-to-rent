# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require "faker"
require "uri"

puts "Destroying the items in db"
Booking.destroy_all
Item.destroy_all



puts "Creating items..."
ITEMS = [
  {
    name: "Dionysus small shoulder bag",
    description: "Designed with eco washed organic GG jacquard denim, Gucci’s Dionysus shoulder bag features the now defining tiger head closure - a unique detail referencing the Greek god Dionysus. The closure is further enhanced with blue enamel while the sliding chain strap can be worn in multiple ways, changing between a shoulder and a top handle bag.",
    size: "M",
    price: "54",
    category: "bag",
    user: User.first,
    photo_url: "https://www.levelshoes.com/media/catalog/product/cache/189fe8db56a91dc68672618a725a226d/4/0/4002492kqfn4483_1.jpg"
  },
  {
    name: "Cluisée Mini Bag",
    description: "Rectangular bag crafted from butter soft tumbled calfskin, featuring decorative frame and oval metal clasp with logo. Perfect with both casual and refined ensembles.",
    size: "S",
    price: "20",
    category: "bag",
    user: User.first,
    photo_url: "https://media.loropiana.com/HYBRIS/FAL/FAL1946/05D7B03E-8F1A-4834-8641-2B02A33AAEC7/FAL1946_MH54_MEDIUM.jpg"
  },
  {
    name: "Hobo Bag",
    description: "Hobo bag with two handles crafted from calfskin with a needle-stripe effect. Very capacious and velvety soft, lined in lambskin.",
    size: "L",
    price: "90",
    category: "bag",
    user: User.first,
    photo_url: "https://media.loropiana.com/HYBRIS/FAL/FAL3384/BF8757B8-2B44-4F21-B6DB-C5C4D4612E08/FAL3384_302A_ZOOM.jpg"
  },
  {
    name: "A-Line V-neck Short/Mini Satin Homecoming Dress With Beading Sequins",
    description: "Chic and short, this homecoming dress make an elegant style staItement for homecoming. It features an embroidered-lace bodice scattered with shimmering rhinestones. The sleeveless bodice has a scalloped-edge along the v-neckline and open back. The short satin skirt flares out in a flattering A-line shape.",
    size: "L",
    price: "20",
    category: "dress",
    user: User.first,
    photo_url: "https://cms.brnstc.de/product_images/435x596/19/04/100087565718500_0.jpg"
  },
  {
    name: "JOVANI - JVN05451 STRAPLESS FLORAL EMBROIDERED GLITTER BALLGOWN",
    description: "Unveil an opulently stunning flair when donning this Jovani JVN05451 Prom gown. This fabulous gown is crafted in shimmer glitter tulle with a strapless corset style bodice with beautiful details embroidery and 3d florals. The dress is pulled together at the back with hidden zipper closure while the fully lined skirt flourishes an elegantly gathered ballgown style with a defined flared finish with its horsehair hem. Look like a total beauty in this mesmerizingly ornamented Jovani masterpiece. Model represents the dress in Gold color.",
    size: "XS",
    price: "76",
    category: "dress",
    user: User.first,
    photo_url: "https://images.unsplash.com/photo-1549565995-20b55ba61132?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1355&q=80"
  },
  {
    name: "MAC DUGGAL - 67582 RUFFLED ASYMMETRIC BALLGOWN",
    description: "Be the center of attention on your next formal occasion in this chic look from Mac Duggal 67582. Enchants in a ruffled, one shoulder neckline with a fitted bodice and a back zipper closure. The skirt opens in a voluminous ballgown silhouette. Get ready to shine in this fabulous Mac Duggal creation.",
    size: "XL",
    price: "70",
    category: "dress",
    user: User.first,
    photo_url: "https://i.imgur.com/wRnEMTM.jpg"
  },
  {
    name: "DA VINCI BRIDAL - 50510 V NECK FLORAL LACED BALLGOWN",
    description: "Da Vinci Bridal 50510 wedding dress boasts modern glamour and vintage-inspired charm while exuding timeless romance. Look sophisticated and elegant in this classic Lace & Tulle, fit and flare wedding dress. This dress features a sheer lace floral bodice in a V-neck embroided lace straps open back covered in buttons. This A line ball gown is covered in a lovely floral lace detailing and ending in a beautiful chapel train. This Da Vinci Bridal style is perfect for any traditional wedding or lavish affair.",
    size: "XS",
    price: "130",
    category: "dress",
    user: User.first,
    photo_url: "https://img.veaul.com/product/070de90c4ea075c7a8d17a80bbc0ce86/elegante-lavendel-ballkleider-2018-a-linie-spitze-blumen-perle-stoffgurtel-off-shoulder-kurze-armel-ruckenfreies-lange-festliche-kleider-560x560.jpg"
  },
  {
    name: "JIMMY CHOO",
    description: "PUMPS JIMMY CHOO, SUEDE 100%, color GREEN, Heel 85mm, Leather sole, FW20, product code ROMY85SUECACTUS",
    size: "L",
    price: "87",
    category: "shoe",
    user: User.first,
    photo_url: "https://d3312htug2rvv.cloudfront.net/img/600/744/resize/productImages/176fe1dea905976907f90e7f272a167d.jpeg"
  },
  {
    name: "Vivette Suede Heels - Sand",
    description: "Nude leather and suede pointed pumps from Laurence Dacade featuring a slip-on style, a brand embossed insole and a high heel.",
    size: "XXL",
    price: "35",
    category: "shoe",
    user: User.first,
    photo_url: "https://d3312htug2rvv.cloudfront.net/img/600/744/resize/productImages/a1465c15335d359a098e25e458b20749.jpeg" }
]

ITEMS.each do |item_params|
  file = URI.open(item_params[:photo_url])
  item_params.delete(:photo_url)
  item = Item.create(item_params)
  item.photos.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
end
