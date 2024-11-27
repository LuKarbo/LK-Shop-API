const editorCategoryModel = require("../Models/editorCategoryModel.js");

exports.getAllCategories = async (req, res) => {
    try {
        const categoriesData = await editorCategoryModel.getAllCategories();
        return res.status(200).json({
            success: true,
            data: categoriesData
        });
    } catch (error) {
        return res.status(500).json({ 
            success: false,
            message: 'Error al obtener las categorias',
            error: error.message 
        });
    }
};

exports.getAlleditors = async (req, res) => {
    try {
        const editorsData = await editorCategoryModel.getAlleditors();
        return res.status(200).json({
            success: true,
            data: editorsData
        });
    } catch (error) {
        return res.status(500).json({ 
            success: false,
            message: 'Error al obtener los editores',
            error: error.message 
        });
    }
};
