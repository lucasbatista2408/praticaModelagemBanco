CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"categoryId" int NOT NULL,
	"sizeId" int NOT NULL,
	"name" TEXT NOT NULL,
	"price" int NOT NULL,
	"mainPicture" TEXT NOT NULL,
	"pictures" TEXT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.category" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.size" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "size_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cart" (
	"id" serial NOT NULL,
	"userId" int NOT NULL,
	"productId" int NOT NULL,
	"sizeId" int NOT NULL,
	"quantity" int NOT NULL,
	CONSTRAINT "cart_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchase" (
	"id" serial NOT NULL,
	"userId" int NOT NULL,
	"productId" int NOT NULL,
	"sizeId" int NOT NULL,
	"deliveryId" int NOT NULL,
	"quantity" int NOT NULL,
	"purchaseData" TIMESTAMP NOT NULL,
	CONSTRAINT "purchase_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.deliveryInfo" (
	"id" serial NOT NULL,
	"userId" int NOT NULL,
	"street" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"number" int NOT NULL DEFAULT 'no number',
	"country" TEXT NOT NULL DEFAULT 'no number',
	CONSTRAINT "deliveryInfo_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "category"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("sizeId") REFERENCES "size"("id");



ALTER TABLE "cart" ADD CONSTRAINT "cart_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "cart" ADD CONSTRAINT "cart_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "cart" ADD CONSTRAINT "cart_fk2" FOREIGN KEY ("sizeId") REFERENCES "size"("id");

ALTER TABLE "purchase" ADD CONSTRAINT "purchase_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_fk2" FOREIGN KEY ("sizeId") REFERENCES "size"("id");
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_fk3" FOREIGN KEY ("deliveryId") REFERENCES "deliveryInfo"("id");

ALTER TABLE "deliveryInfo" ADD CONSTRAINT "deliveryInfo_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");








