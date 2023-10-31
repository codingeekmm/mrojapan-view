-- CreateTable
CREATE TABLE "Company" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "Company_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Loginuser" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "companyId" TEXT NOT NULL,

    CONSTRAINT "Loginuser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Screen" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "Screen_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Component" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "Component_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role_screen" (
    "role" TEXT NOT NULL,
    "screen" TEXT NOT NULL,
    "loginuserId" TEXT,

    CONSTRAINT "role_screen_pkey" PRIMARY KEY ("role","screen")
);

-- CreateTable
CREATE TABLE "screen_component" (
    "screen" TEXT NOT NULL,
    "component" TEXT NOT NULL,

    CONSTRAINT "screen_component_pkey" PRIMARY KEY ("screen","component")
);

-- CreateTable
CREATE TABLE "loginuser_role" (
    "role" TEXT NOT NULL,
    "loginuser" TEXT NOT NULL,

    CONSTRAINT "loginuser_role_pkey" PRIMARY KEY ("role","loginuser")
);

-- AddForeignKey
ALTER TABLE "Loginuser" ADD CONSTRAINT "Loginuser_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_screen" ADD CONSTRAINT "role_screen_role_fkey" FOREIGN KEY ("role") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_screen" ADD CONSTRAINT "role_screen_screen_fkey" FOREIGN KEY ("screen") REFERENCES "Screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_screen" ADD CONSTRAINT "role_screen_loginuserId_fkey" FOREIGN KEY ("loginuserId") REFERENCES "Loginuser"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "screen_component" ADD CONSTRAINT "screen_component_screen_fkey" FOREIGN KEY ("screen") REFERENCES "Screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "screen_component" ADD CONSTRAINT "screen_component_component_fkey" FOREIGN KEY ("component") REFERENCES "Component"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "loginuser_role" ADD CONSTRAINT "loginuser_role_role_fkey" FOREIGN KEY ("role") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "loginuser_role" ADD CONSTRAINT "loginuser_role_loginuser_fkey" FOREIGN KEY ("loginuser") REFERENCES "Loginuser"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
