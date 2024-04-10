<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Materia</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-200 flex justify-center items-center h-screen">
<div class="flex flex-col items-center justify-center flex-1 h-full px-4 sm:px-0">
    <div class="flex rounded-lg shadow-lg w-full sm:w-3/4 lg:w-1/2 bg-white sm:mx-0">
        <div class="flex flex-col w-full p-4">
            <div class="flex flex-col flex-1 justify-center mb-8">
                <h1 class="text-4xl text-center font-thin mt-[2rem]">Registro de Materia</h1>
                <div class="w-full mt-4 flex justify-center mt-[3rem]">
                    <form class="w-full max-w-lg" method="POST" action="materia">
                        <div class="flex flex-wrap -mx-3 mb-6">
                            <div class="w-full px-3">
                                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="codigo">Código de la materia:</label>
                                <input id="codigo" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" name="codigo" required placeholder="Codigo">
                            </div>
                            <div class="w-full px-3">
                                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="nombre">Nombre de la materia:</label>
                                <input id="nombre" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" name="nombre" required placeholder="Nombre">
                            </div>
                            <div class="w-full px-3">
                                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="descripcion">Descripción:</label>
                                <textarea id="descripcion" rows="4" cols="50" class="appearance-none block w-full bg-gray-200 text-gray-700 border rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" name="descripcion" required placeholder="Descripción sobre la materia"></textarea>
                            </div>
                            <div class="w-full px-3">
                                <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="fecha">Fecha de Creación:</label>
                                <input id="fecha" type="date" class="appearance-none block w-full bg-gray-200 text-gray-700 border rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" name="fecha" required placeholder="Fecha de Nacimiento">
                            </div>
                        </div>
                        <div class="flex justify-between">
                            <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600">Registrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

