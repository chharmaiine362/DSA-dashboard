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
      width: '150%', // Set to 50% of the parent container
      '.MuiPaper-root': { // This targets the root of the Accordion component which is a Paper element
        width: '150%', // Ensure the accordion takes the full width of the Box
        backgroundColor: 'green', // Set the FAQ boxes to light blue
        color: 'white', // Set the text color to white
        boxShadow: 'none', // Removes the default shadow
        '&:not(:last-child)': {
          marginBottom: '30px', // Adds space between the accordion items
        },
      },
      '.MuiAccordionDetails-root': { // This targets the AccordionDetails component
        backgroundColor: 'red', // Ensure the details match the Accordion color
        color: 'white', // Text color for the accordion details
      },
      '.MuiAccordionSummary-root': { // This targets the AccordionSummary component
        backgroundColor: 'yellow', // Ensure the summary matches the Accordion color
        color: 'white', // Text color for the accordion summary
        borderBottom: '1px solid white', // Add a white border to separate summary and details
      },
      '.MuiButtonBase-root': { // This targets the button base which includes the expand icon
        color: 'white', // Set the expand icon color to white
      }
    }}>
      {questions.map((question, index) => (
        <Accordion key={index} defaultExpanded>
          <AccordionSummary expandIcon={<ExpandMoreIcon />}>
            <Typography variant="h6">
              {question}
            </Typography>
          </AccordionSummary>
          <AccordionDetails>
            <Typography>
              {answers[index]}
            </Typography>
          </AccordionDetails>
        </Accordion>
      ))}
    </Box>
  );
};

export default FAQ;
