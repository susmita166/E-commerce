const fs = require('fs');
const xml2js = require('xml2js');
const Employee = require('../../models/Product/employee');

const readXml = async (req, res) => {
    if (!req.file) {
        return res.status(400).json({ message: 'No file uploaded' });
    }

    try {
        const filePath = req.file.path;
        const fileContent = fs.readFileSync(filePath, 'utf8');
        console.log('File Content:', fileContent); // Log the entire file content

        xml2js.parseString(fileContent, async (err, result) => {
            if (err) { 
                return res.status(500).json({ message: 'Error parsing XML', error: err.message });
            }

            try {
                const employees = result.company.employees[0].employee;
                const employeeDataArray = employees.map(emp => ({
                    name: emp.name[0],
                    position: emp.position[0],
                    department: emp.department[0]
                }));

                console.log('Employee Data Array:', JSON.stringify(employeeDataArray, null, 2));

                for (const employeeData of employeeDataArray) {
                    try {
                        await Employee.create(employeeData);
                    } catch (dbError) {
                        console.error('Database validation error:', dbError.errors); // Log detailed validation errors
                        return res.status(500).json({
                            message: 'Validation error',
                            error: dbError.errors
                        });
                    }
                }

                fs.unlinkSync(filePath); // Clean up the uploaded file
                return res.status(200).json({ message: 'XML file processed and data uploaded successfully' });
            } catch (processingError) {
                console.error('Error processing XML data:', processingError); // Log processing errors
                return res.status(500).json({ message: 'Error processing XML data', error: processingError.message });
            }
        });
    } catch (error) {
        console.error('Error processing file:', error.message); // Log file processing errors
        return res.status(500).json({ message: 'Error processing file', error: error.message });
    }
};

module.exports = { readXml };
