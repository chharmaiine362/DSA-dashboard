import React from 'react';
import Box from "@mui/material/Box";
import Accordion from "@mui/material/Accordion";
import AccordionSummary from "@mui/material/AccordionSummary";
import AccordionDetails from "@mui/material/AccordionDetails";
import Typography from "@mui/material/Typography";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";

const FAQ = () => {
    const questions = [
        'Question_1',
        'Question_2',
        'Question_3',
        'Question_4',
        'Question_5'
    ];

    const answers = [
        'Answer_1',
        'Answer_2',
        'Answer_3',
        'Answer_4',
        'Answer_5'
    ];

    return (
        <Box sx={{
            margin: '40px',
            width: '150%', // Set to 150% of the parent container
            '.MuiPaper-root': { // This targets the root of the Accordion component which is a Paper element
                width: '150%', // Ensure the accordion takes the full width of the Box
                backgroundColor: '#658fb9', // Set the FAQ boxes to light blue
                color: 'white', // Set the text color to white
                boxShadow: 'none', // Removes the default shadow
                '&:not(:last-child)': {
                    marginBottom: '30px', // Adds space between the accordion items
                },
            },
            // answer text
            '.MuiAccordionDetails-root': { // This targets the AccordionDetails component
                backgroundColor: '#405370', // Ensure the details match the Accordion color
                color: 'white', // Text color for the accordion details
            },
            // question text
            '.MuiAccordionSummary-root': { // This targets the AccordionSummary component
                backgroundColor: '#658fb9', // Ensure the summary matches the Accordion color
                color: 'white', // Text color for the accordion summary
                borderBottom: '1px solid white', // Add a white border to separate summary and details
            },
            '.MuiButtonBase-root': { // This targets the button base which includes the expand icon
                color: 'white', // Set the expand icon color to white
            }
        }}>
            {questions.map((question, index) => (
                <Accordion key={index} defaultExpanded>
                    <AccordionSummary backgroundColor='#ffabcd' expandIcon={<ExpandMoreIcon sx={{ bgcolor: '#658fb9' }} />} >
                        <Typography width='100%' variant="h6" backgroundColor='#658fb9' >
                            {question}
                        </Typography>
                    </AccordionSummary>
                    <AccordionDetails>
                        <Typography backgroundColor='#405370'>
                            {answers[index]}
                        </Typography>
                    </AccordionDetails>
                </Accordion>
            ))}
        </Box>
    );
};

export default FAQ;
