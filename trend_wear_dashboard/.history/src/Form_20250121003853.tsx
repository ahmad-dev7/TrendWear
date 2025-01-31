import "bootstrap/dist/css/bootstrap.css";
import { FormEvent, useState } from "react";

const Form = () => {
  const handleSubmit = (event: FormEvent) => {
    event.preventDefault();
  };

  return <form onSubmit={handleSubmit}></form>;
};

export default Form;
