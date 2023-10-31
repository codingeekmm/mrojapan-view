import { Prisma, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({ errorFormat: "pretty" });

const loadLoginUsers = async () => {
  const loginUsersInput: Prisma.UserCreateManyInput[] = [
    { name: "Bob" },
    { name: "Alice" },
  ];

  await prisma.loginuser.createMany({
    data: loginUsersInput,
  });
};
