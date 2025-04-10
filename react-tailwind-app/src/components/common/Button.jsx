import React from 'react';

const Button = ({ children, onClick, className, type = 'button' }) => {
    return (
        <button
            type={type}
            onClick={onClick}
            className={`px-4 py-2 rounded bg-blue-500 text-white hover:bg-blue-600 ${className}`}
        >
            {children}
        </button>
    );
};

export default Button;