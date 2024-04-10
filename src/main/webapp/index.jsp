<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-200 flex justify-center items-center h-screen">
<div class="bg-blue-400 h-screen w-screen">
    <div class="flex flex-col items-center flex-1 h-full justify-center px-4 sm:px-0">
        <div class="flex rounded-lg shadow-lg w-full sm:w-3/4 lg:w-1/2 bg-white sm:mx-0" style="height: 500px">
            <div class="flex flex-col w-full md:w-1/2 p-4">
                <div class="flex flex-col flex-1 justify-center mb-8">
                    <h1 class="text-4xl text-center font-thin">Bienvenido de vuelta</h1>
                    <div class="w-full mt-4">
                        <%
                            String error = request.getParameter("error");
                            if ("true".equals(error)) {
                                %>
                                    <p class="text-red-500 text-center">Credenciales incorrectas. Por favor, intenta de nuevo.</p>
                                <%
                            }
                        %>
                        <form class="form-horizontal w-3/4 mx-auto" method="POST" action="login">
                            <div class="flex flex-col mt-4">
                                <input id="username" type="text" class="flex-grow h-8 px-2 border rounded border-grey-400" name="username" value="" placeholder="Nombre de usuario">
                            </div>
                            <div class="flex flex-col mt-4">
                                <input id="password" type="password" class="flex-grow h-8 px-2 rounded border border-grey-400" name="password" required placeholder="Contraseña">
                            </div>
                            <div class="flex flex-col mt-8">
                                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Iniciar Sesión</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="hidden md:block md:w-1/2 rounded-r-lg" style="background: url('https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3300&q=80'); background-size: cover; background-position: center center;"></div>
        </div>
    </div>
</div>
</body>
</html>

